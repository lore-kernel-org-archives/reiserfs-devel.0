From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: serious Reiser4 fsck problem
Date: Mon, 24 Jul 2006 18:47:21 +0400
Message-ID: <1153752441.26532.70.camel@tribesman.namesys.com>
References: <44C1F93A.9090109@gmx.net> <op.tc248azkd4os1z@localhost>
	 <44C1FF14.7040504@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C1FF14.7040504@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dirk <noisyb@gmx.net>
Cc: =?iso-8859-2?Q?=A3ukasz?= Mierzwa <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello

On Sat, 2006-07-22 at 12:33 +0200, Dirk wrote:
> Łukasz Mierzwa wrote:
> > Dnia Sat, 22 Jul 2006 12:08:58 +0200, Dirk <noisyb@gmx.net> napisał:
> > 
> >> Hello,
> >> will using
> >>
> >> fsck.reiser4 --build-fs
> >>
> >> result in data loss? I mean to fix the partition - NOT to lose the data
> >> on it..
> >>
> >> The manual page is also not very specific about if data will be lost or
> >> not when using this option...
> >>
> >> Using --fix resulted in a message that I should use --build-fs to remove
> >> corruption...
> > 
> > 
> > You will probably end up with some amount of files in lost&found dir, 
> > those will be the files that fsck can't recognize from what dir are
> > coming  and what are named, depending on what corruption You have there
> > can always  be some files that You won't get back. As always, backups
> > are a must have  on any fs.
> > 
> > 
> 
> The hdd was full and a process was still trying to write and create new
> files... So I guess those files might end up in lost+found...
> 
> Just want to make sure that --build-fs will not build a _new_ fs,
> meaning formatting the fs by formatting it?!? 

it will not format. This is another mode of recovering.

> That wasn't very clear
> from what I'd read in the manual...
> 



> Dirk
> 

