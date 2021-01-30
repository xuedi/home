#!/usr/bin/php
<?php

/* ----- AdapTec -----
 * sudo arcconf GETCONFIG 1
 *   Option  AD  : Adapter information only
 *           LD  : Logical device information only
 *           LD# : Optionally display information about the specified logical device
 *           PD  : Physical device information only
 *           MC  : Maxcache 3.0 information only
 *           CN  : Connector information for smartHBA only
 *           AL  : All information (optional)
 *
 * ----- Other commands -----
 * lsscsi -g                       # devices
 * smartctl -d sat –all /dev/sgX   # show device infos
 * systool -v -m aacraid           # kernel modules configuration
 * smartctl -a -d "aacraid,0,0,1" /dev/sdb  # look through the device, parameter unknown for me so far
 *
 * ----- infos -----
 * https://www.thomas-krenn.com/de/wiki/Smartmontools_mit_Adaptec_RAID_Controller
 * /sys/module/aacraid/parameters/expose_physicals
 * https://www.cyberciti.biz/faq/linux-checking-sas-sata-disks-behind-adaptec-raid-controllers/
 * https://manpages.ubuntu.com/manpages/hirsute/man8/smartctl.8.html#examples
 */


function getValue(string $key, array $lines): string
{
    foreach ($lines as $line) {
        if (strpos($line, $key) !== false) {
            return trim(strstr($line, ':'), ": ");
        }
    }
    return 'NotFound';
}

function getTemperature(array $data): string
{
    $controllerTemp = getValue('Temperature', $data);
    $startCut = strpos($controllerTemp, '/') - 2;
    $endCut = strpos($controllerTemp, 'F ') + 1;
    return substr($controllerTemp, 0, $startCut) . '°C' . substr($controllerTemp, $endCut);
}

function getSize(string $size): string
{
    return substr($size, strpos($size, '[') + 1, -1);
}

function controllerInfos(): void
{
    echo '### Controller ###' . PHP_EOL;
    $data = [];
    exec('sudo arcconf GETCONFIG 1 AD', $data);

    echo getValue('Controller Model', $data);
    echo '(' . getValue('Controller Serial Number', $data) . ') ';
    echo 'status: ' . getValue('Controller Status', $data) . ' ';
    echo '@ ' . getTemperature($data);
    echo PHP_EOL;
}

function hddInfos(int $distNum): void
{
    $data = [];
    exec('sudo smartctl -a -d "aacraid,0,0,' . $distNum . '" /dev/sdb', $data);

    echo getValue('Product', $data) . ' ';
    echo '(' . getValue('Serial number', $data) . ') ';
    echo 'status: ' . getValue('SMART Health Status', $data) . ' ';
    echo 'size: ' . getSize(getValue('User Capacity', $data)) . ' ';
    echo '@ ' . getValue('Current Drive Temperature', $data);
    echo PHP_EOL;
}


// "aacraid,0,0,X"
$disks = [
    'WD-WCAZA8004341' => 0,
    'WD-WCAZA8005607' => 1,
    'ZA15ZJCY' => 2,
    'ZA160BLL' => 6,
    'ZA160AVG' => 7,
];


controllerInfos();
foreach ($disks as $diskNumber) {
    hddInfos($diskNumber);
}