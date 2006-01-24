From: "Barry K. Nathan" <barryn@pobox.com>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Tue, 24 Jan 2006 09:59:41 -0800
Message-ID: <986ed62e0601240959i2afc15e5v55a4ed0f31c5635b@mail.gmail.com>
References: <43C97E17.7030604@xterminate.me.uk>
	 <20060115204143.GC24752@atrey.karlin.mff.cuni.cz>
	 <43CAC054.5020104@xterminate.me.uk>
	 <20060116104137.GA18267@atrey.karlin.mff.cuni.cz>
	 <43D376BE.7010800@xterminate.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: barrykn@gmail.com
In-Reply-To: <43D376BE.7010800@xterminate.me.uk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Barnwell <xterminate@xterminate.me.uk>
Cc: Jan Kara <jack@ucw.cz>, reiserfs-list@namesys.com

On 1/22/06, Michael Barnwell <xterminate@xterminate.me.uk> wrote:
> Can anyone suggest a test to tell if it is the disk controller?

If you don't mind wiping out the entire disk, I guess this would work
(I've never tried it on an actual failing disk controller though):

badblocks -w -s -t random /dev/whateverdisk

(or I guess you could try making a small partition and running it on that)

If badblocks lists tons of supposedly bad blocks, then it's not the
filesystem. The output might be easier to read without -s, but then
you'll have no indication of progress as it runs. Maybe this
incantation would be better:

badblocks -w -s -t random -o /some/file /dev/whateverdisk

Then you can keep a second shell open and check whether /some/file has
any blocks listed in it. If so, then that too eliminates the
filesystem as a suspect.

--
-Barry K. Nathan <barryn@pobox.com>
