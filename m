From: Christophe Saout <christophe@saout.de>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Sat, 23 Aug 2003 02:15:00 +0200
Message-ID: <1061597700.4265.5.camel@chtephan.cs.pocnet.net>
References: <20030822150853.GA960@namesys.com>
	 <1061574745.5714.1.camel@pilot.stavtrup-st.dk>
	 <16198.22925.274848.501590@laputa.namesys.com>
	 <1061575717.21328.4.camel@pilot.stavtrup-st.dk>
	 <16198.23850.137603.310946@laputa.namesys.com>
	 <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15393-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Nielsen <Lovechild@foolclan.com>
Cc: reiserfs-list@namesys.com

Am Sa, 2003-08-23 um 01.47 schrieb David Nielsen:

> The entire thing then fails with these messages - no notable compile
> errors or warnings present. 
> 
> fs/built-in.o(.text+0x9a8cd): In function `print_context':
> : undefined reference to `info_atom'
> fs/built-in.o(.text+0x9e392): In function `commit_current_atom':
> : undefined reference to `info_atom'
> fs/built-in.o(.text+0xa0577): In function `print_atom':
> : undefined reference to `info_atom'
> make: *** [.tmp_vmlinux1] Error 1

You need to set CONFIG_REISER4_DEBUG to yes. I didn't find the entry in
menuconfig, but you can to that in the .config file directly.

> Seems this patch might have benefited from a compile test at least? :)

It does, it's a bit tricky though. BTW: Which version of yacc is needed
exactly to create the parser? I tried applying the diff file to various
versions but none did match.

The fs doesn't seem to stand my stress test anyway. I copied my whole
filesystem to a newly created reiser4 volume, and tried to boot from
that. The first thing I noticed it that remount or sync when its mounted
read-only makes it go boom (never-ending emergency flushs). I tricked
the init script to leave it read-write and I got to my X login, could
log in, but then the system freezed hard. :(

My subjective feeling was that booting time was about the same as with
reiser3 even if the files weren't fragmented.

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html

