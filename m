From: "bo" <bo@sosnetwork.net>
Subject: Mount and file system size issue
Date: Thu, 6 Jun 2002 14:09:31 -0700
Message-ID: <001201c20d9e$73e5d070$5701a8c0@bomoon>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Reisers,

I do not understand well about "Reiserfs can be run on any linux supported
arch with
Linux2.4.13 and above." from FAQ of www.namesys.com.

I am running the ARM-Linux, which is based on Debian 2.4.5.

I tried to make and mount the reiserfs on 20G size, it was OK.
However, for 120G size, it is OK to make the file system but
I can not mount it.

It is really strange. Sometimes it is mounted after 1 hour of "mount"
command.
I could see it by "df".

Most of time it never come back from "mount -reiserfs ".

Is it really a problem of Linux revision?
Should I upgrade my linux to 2.4.13 or above to make the REISERFS work?

Thanks in advance,

Bo

