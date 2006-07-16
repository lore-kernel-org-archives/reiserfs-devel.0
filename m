From: Hans Reiser <reiser@namesys.com>
Subject: Re: [mythtv-users] Permission denied to ls for root?
Date: Sun, 16 Jul 2006 00:18:00 -0700
Message-ID: <44B9E828.7070006@namesys.com>
References: <674c6cd30607141802p3fb2a0d0g9e5271c8c801ee29@mail.gmail.com>	 <1ba87a1f0607141831q5f623790q92b94a4f7602c751@mail.gmail.com>	 <44B847E7.8020501@thirdcontact.com> <674c6cd30607141850x4ecf5d6bhd16c35481aaca1ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <674c6cd30607141850x4ecf5d6bhd16c35481aaca1ff@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Steffes <rbsteffes@gmail.com>
Cc: Discussion about mythtv <mythtv-users@mythtv.org>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

Ryan Steffes wrote:

>
>
> On 7/14/06, *Michael T. Dean* <mtdean@thirdcontact.com
> <mailto:mtdean@thirdcontact.com>> wrote:
>
>     On 07/14/2006 09:31 PM, Carl Fongheiser wrote:
>     > On 7/14/06, *Ryan Steffes* <rbsteffes@gmail.com
>     <mailto:rbsteffes@gmail.com>
>     > <mailto:rbsteffes@gmail.com <mailto:rbsteffes@gmail.com>>> wrote:
>     >
>     >     I've never seen ls do this before, at least, not for root.  Any
>     >     idea what could cause it?
>     >
>     >     # ls
>     >     ls: 1036_20060417230000_20060417233000.nuv.png: Permission
>     denied
>     >     ls: 1056_20060610130000.mpg: Permission denied
>     >     ls: 1006_20050920213000_20050920220000.nuv.png: Permission
>     denied
>     >     ls: 1013_20060420201900_20060420203000.nuv: Permission denied
>     >     ls: 1003_20060419220000_20060419230000.nuv.png: Permission
>     denied
>     >
>     >     Can't delete em, look at em, touch em, chmod em, or chown
>     em, even
>     >     as root.  It's odd.
>     >
>     >
>     > Are these files on a remote NFS share?   If so, that's not unusual.
>     > Root is usually mapped to "nobody" on remote NFS servers.
>
>     Or, it could happen because of a stale NFS file handle (fixable by
>     unmounting/remounting).
>
>     Mike
>     _______________________________________________
>     mythtv-users mailing list
>     mythtv-users@mythtv.org <mailto:mythtv-users@mythtv.org>
>     http://mythtv.org/cgi-bin/mailman/listinfo/mythtv-users
>
>
>
> It appears the answer I may have to go with is some sort of corruption
> in the file system.  I'm CCing this to the reiserfs list, since that's
> what the partition is.  On reboot, the partition starts to load, and
> hangs up on "Checking Internal Tree.." and gets no further.
>
> Any suggestions on how to recover without losing all my data?
>
> Ryan
>
>
Send lots more details to vs@namesys.com.
