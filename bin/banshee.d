#!/usr/bin/env rdmd

import std.stdio;
import std.file;
import std.process;
import core.sys.posix.stdlib;
import core.thread;

void main() {
	write("Starting Banshee ");
	if(exists("/home/xuedi/private/myMusic/empty")) {
		pipeShell("sshfs -o nonempty pollux:/home/xuedi/private/myMusic /home/xuedi/private/myMusic");
		for( int a=10; a<20; a =a+1 ) {
			write("-");
			if(!exists("/home/xuedi/private/myMusic/empty")) {
				pipeShell("banshee");
				writeln("> OK");
				exit(-1);
			}
			Thread.sleep(1.seconds);
		}
		writeln("--> FAILED: Could no mount!");
		exit(1);
	}
	writeln("--> OK");
	pipeShell("banshee");
	exit(-1);
}