From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: shrink reiserfs
Date: Sun, 23 Jan 2005 22:07:35 +0300
Message-ID: <20050123190735.GH10921@backtop.namesys.com>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net> <20050123171105.GG10921@backtop.namesys.com> <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Hawkes <jake@infinitylimited.net>
Cc: reiserfs-list@namesys.com

On Sun, Jan 23, 2005 at 10:49:56AM -0700, Jake Hawkes wrote:
> Alex Zarochentsev said:
> > Hello,
> >
> > On Sun, Jan 23, 2005 at 08:48:14AM -0700, Jake Hawkes wrote:
> >> Hi.
> >>
> >>  resize_reiserfs says that there are already too many allocated blocks.
> >
> > which resize_reiserfs command produces the error message?
> 
> resize_reiserfs -v -s -1G /dev/hda4
> 
> and when that failed, I tried
> 
> resize_reiserfs -v -s -1M /dev/hda4

and it failed too?

which reiserfsprogs version are you using?  It is possible
that this bug is fixed already in the latest release of
reiserfsprogs (3.6.19).

> 
> >> jake@jacobh jake $ df -h
> >> Filesystem            Size  Used Avail Use% Mounted on
> >> /dev/hda4              38G  7.1G   31G  20% /
> >> /dev/hda2              16G   15G  1.6G  91% /mnt/xp
> >> none                  506M     0  506M   0% /dev/shm
> >>
> >>
> >> so how can this be possible if it is only 20% used?
> >
> > the shrinker can't make the fs less than 7.1G in size.
> 
> 
> I had to read that af ew times before I realised you were talking about my
> installation and not a general reiserfs issue :D
> 
> given the command above then, what can I do?

-- 
Alex.
