From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: A file-based interface for mount
Date: Wed, 9 Jul 2003 17:42:57 +0400
Message-ID: <16140.7137.369855.682433@laputa.namesys.com>
References: <3F078EF1.6090908@mrs.umn.edu>
	<3F0C161B.6030707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F0C161B.6030707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Grant Miner wrote:
 > 
 > > Would it make sense to use a file interface in the file system to 
 > > control mounting?  Have a file that exists per-directory named ..mount 
 > > (or something).  Then, to mount /dev/sda on /home, echo "/dev/sda rw" 
 > > > /home/..mount
 > > To unmount the file system, remove the line from the ..mounts file.  
 > > You could also do plan 9 layered mounts (with priorities) by putting 2 
 > > or more lines in that file.  The advantage is you could set access 
 > > controls on each file to easily let non-root users perform mount at 
 > > certain directories, and you don't need the mount and unmount commands 
 > > anymore.
 > >
 > > What do you think?
 > >
 > >
 > >
 > Cool.  Probably not hard to write.  Can I get you to write it for 
 > Reiser4?  If so, we can discuss details (I will be delayed for a week in 
 > answering though due to traveling.)

Adding new mount is not hard. Removing a mount through editing ..mount
is much harder, it's much easier to do something like 

echo "/dev/sda" > foo/..umount

But what exactly is an advantage of this interface?
If user is allowed to mount arbitrary file system at /some-place, it can
mount something containing suid binary and here we go.

 > 
 > -- 
 > Hans
 > 
 > 

Nikita.
