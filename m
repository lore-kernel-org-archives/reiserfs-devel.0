From: Mike Benoit <mikeb@netnation.com>
Subject: Re: Reiser4 segfault perhaps?
Date: Tue, 21 Oct 2003 13:20:58 -0700
Message-ID: <1066767658.10994.34.camel@mikeb.staff.netnation.com>
References: <1066671812.1407.14.camel@mikeb.staff.netnation.com>
	 <16277.1772.853617.134394@laputa.namesys.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16277.1772.853617.134394@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com



On Tue, 2003-10-21 at 03:14, Nikita Danilov wrote:
> Mike Benoit writes:
>  > In an attempt to be brave, I tried migrating my /home partition to
>  > Reiser4 (I backup 3 times/day). At the time I had a Windows share
>  > mounted with Samba, /backup and / partition mounted as ext3, and a
>  > "fresh" /home partition mounted as Reiser4. 
>  > 
>  > I then tried copying everything (1GB) from the /backup partition to the
>  > /home partition, then in another terminal proceeded to type "df" over
>  > and over again as fast as I could... Apparently that was a bad idea. 
> 
> Do you have some other exotic file system mounted? Call-chain
> writeback_inodes()->generic_sync_sb_inodes() is impossible in reiser4.
> 

I had a single NFS export mounted at the time. Thats it though. 

>  > 
>  > PS. Hans, I'm interested in how the laptop migration to Reiser4 is
>  > going?
>  > 
>  > Oct 20 09:59:06 mikeb kernel: kjournald starting.  Commit interval 5
>  > seconds
>  > Oct 20 09:59:06 mikeb kernel: EXT3 FS on hda7, internal journal
> 
> Nikita.
-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

