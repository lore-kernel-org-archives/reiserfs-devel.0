From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount and file system size issue
Date: Fri, 7 Jun 2002 11:21:21 +0400
Message-ID: <20020607112121.C12869@namesys.com>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <001201c20d9e$73e5d070$5701a8c0@bomoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bo <bo@sosnetwork.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 06, 2002 at 02:09:31PM -0700, bo wrote:

> I am running the ARM-Linux, which is based on Debian 2.4.5.

2.4.5 is way too outdated for purposes of using reiserfs.

> I tried to make and mount the reiserfs on 20G size, it was OK.
> However, for 120G size, it is OK to make the file system but
> I can not mount it.

What do you mean by "cannot mount"?
What is the error message if you get one?

> Most of time it never come back from "mount -reiserfs ".

Ah, so it just mounts, but does very slow.
BTW, how you get 120GB on your ARM system?
Do you have IDE controller and HDD attached to it or is this something
accessed over network?

> Is it really a problem of Linux revision?
> Should I upgrade my linux to 2.4.13 or above to make the REISERFS work?

Upgrading to 2.4.18 is highly advisable.

Bye,
    Oleg
