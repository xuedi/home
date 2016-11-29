#!/usr/bin/env rdmd

import std.stdio;
import std.file;
import std.process;
import core.thread;

int main() {
	write("Starting Banshee ");
	if(exists("/home/xuedi/private/myMusic/empty")) {
		pipeShell("sshfs -o nonempty pollux:/home/xuedi/private/myMusic /home/xuedi/private/myMusic");
		foreach(i; 0 .. 10) {
			write("-");
			if(!exists("/home/xuedi/private/myMusic/empty")) {
				pipeShell("banshee");
				writeln("> OK");
				return 0;
			}
			Thread.sleep(1.seconds);
		}
		writeln("--> FAILED: Could no mount!");
		return 1;
	}
	writeln("--> OK");
	pipeShell("banshee");
	return 0;
}