From: Jeff Davis <reiser-list@empires.org>
Subject: reiser4 as module
Date: Wed, 21 Jul 2004 19:00:47 -0700
Message-ID: <1090461647.1676.16.camel@jeff>
References: <20040721231748.46066.qmail@web60310.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040721231748.46066.qmail@web60310.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Using 2.6.5-rc with the all.diff.gz patch on the website.

I am trying to develop my own plugin. I think I got a good start, I
added an extra built-in pseudo file. However, it's slow going because I
have to reboot to test my code.

I tried compiling reiser4 as a module, but if I "rmmod reiser4" then
change the code, then "make modules && make modules_install", then
"modprobe reiser4", then I get a seg fault. After that the reiser4
module is stuck (says it's in use) and I can't use reiser4 at all after
I do that, until I reboot.

Does someone have a better suggestion for me? Is the unloading of
reiser4 problem a bug? Am I not doing it correctly (this is my first
kernel modification)?

As a seperate issue, the plugin I'm trying to ultimately create is one
where you can access a script by doing something like
"/path/to/script.py/pyexe" and it would execute the script and the file
contents would be (read only) the stdout. That would allow cool stuff
like having a configuration file be just data pulled from a database (as
an example). Is this even possible? I'm still trying to figure out how
I'd write it in a secure way (we don't want to execute a user's script
in kernel address space).

	Regards,
		Jeff Davis

P.S. Nice code! The parts I saw were very easy to read and modify.

