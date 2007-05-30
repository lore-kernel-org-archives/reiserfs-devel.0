From: devsk <funtoos@yahoo.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 13:13:39 -0700 (PDT)
Message-ID: <105148.40923.qm@web31710.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-104951430-1180556019=:40923"
Return-path: <reiserfs-list-return-30676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Toby Thain <toby@smartgames.ca>, ReiserFS List <reiserfs-list@namesys.com>

--0-104951430-1180556019=:40923
Content-Type: text/plain; charset=ascii

David, Its funny how my setup is very similar to yours: gentoo, amd64, nvraid using dmraid. mount/mkfs is VERY fast (less than a second) here, and I don't use any specific mount options except noatime. My partition is about 16GB though, hosting '/' and /home.

what sources do you use? I use gentoo-sources (currently using 2.6.21-r2) with the latest stable patch (currently 2.6.21) from namesys, applied manually. Nothing else. I use suspend-to-ram (with a UPS) and the whole system is rock solid.

-devsk

----- Original Message ----
From: David Masover <ninja@slaphack.com>
To: devsk <funtoos@yahoo.com>
Cc: Toby Thain <toby@smartgames.ca>; ReiserFS List <reiserfs-list@namesys.com>
Sent: Wednesday, May 30, 2007 1:03:14 PM
Subject: Re: Filesystem corruption

On Wednesday 30 May 2007 12:22:17 devsk wrote:

> I have used R4 for a year now and I have had to reset my PC,
> troubleshooting problems with vmware/mythtv/cisco vpn client/nvidia, so
> many times that its not even funny! And R4 didn't give me any problems even
> once. It boots right up, without any files lost and consistent FS as a
> subsequent livecd boot and fsck proved it everytime.

That happened to me for maybe a year or so, I'm not sure. Then, slowly, I 
started to get problems. The machine crashing due to some nvidia bug -- or 
even a reiser-specific oops or something -- then I'd have to fsck it, which 
would take an hour or more, then I'd boot, and apparently no problems.

Only, recently, these fsck-a-thons started happening more and more often, and 
I started to lose random files. They'd just be silently truncated to 0 bytes. 
And not files I was writing a lot -- I'm talking about things 
like /bin/mount.

Now, maybe it's an amd64-specific bug. Or (somehow) a dmraid-specific bug, or 
a dont_load_bitmap bug. (Who can blame me; without dont_load_bitmap, it takes 
at least 30 seconds, maybe a minute to mount.) Could even be, somehow, a 
Gentoo-specific bug. Could be a 350-gig-partition bug, or even a bug of the 
it-hates-me variety. (My server ran Reiser4 for awhile longer, with no 
problems, but I wasn't about to take chances there.)

But, I switched a friend over to Ubuntu, and he had the same kind of problems. 
In fact, he had them first (I thought it was his computer, for awhile).

Finally, we switched to stock Ubuntu kernels and XFS, me on dmraid, him on 
normal linux raid5 (md), and we now have no problems. It's even faster -- the 
biggest gain for Reiser4 was /usr/portage, which doesn't exist on Ubuntu.

> If I did that to ext 
> or xfs, I would have lost big time.

Well, I'm on XFS on my desktop now, and ext3 on my server. No problems at all 
so far. Also much faster, because my desktop now has a repacker (xfs_fsr).

> I hope people don't leave this good piece of code to rot!!

Me too, but you know, I can no longer afford to spend a few hours running fsck 
for no apparent reason. I no longer have a machine that can do anything but 
just work.

The killer feature of Reiser4, as implemented, is small file performance that 
makes ReiserFSv3 weep, and v3 makes XFS weep. All the other stuff we were 
promised is either planned for a later release (repacker, pseudofiles, 
transaction API) or barely working (cryptocompress).

And on just about any setup I work on today, small file performance is a small 
enough priority that even the slightest hint of instability is a 
deal-breaker. Enough people feel the same way that ext3 is still widely used. 
And if it's ever really crucial, there's reiserfs3.

So, you can blame it on my hardware, or on not getting kernel inclusion, or 
anything you want, but the only place I still use Reiser4 is on the 
gameserver at our LAN party, and we're thinking of moving that to something 
like ext3 or xfs, just so we don't need custom kernels. And after all, that's 
a gameserver, it's not like the filesystem is the bottleneck anyway.







       
____________________________________________________________________________________Building a website is a piece of cake. Yahoo! Small Business gives you all the tools to get online.
http://smallbusiness.yahoo.com/webhosting 
--0-104951430-1180556019=:40923
Content-Type: text/html; charset=ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;">David, Its funny how my setup is very similar to yours: gentoo, amd64, nvraid using dmraid. mount/mkfs is VERY fast (less than a second) here, and I don't use any specific mount options except noatime. My partition is about 16GB though, hosting '/' and /home.<br><br>what sources do you use? I use gentoo-sources (currently using 2.6.21-r2) with the latest stable patch (currently 2.6.21) from namesys, applied manually. Nothing else. I use suspend-to-ram (with a UPS) and the whole system is rock solid.<br><br>-devsk<br><br><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;">----- Original Message ----<br>From: David Masover
  &lt;ninja@slaphack.com&gt;<br>To: devsk &lt;funtoos@yahoo.com&gt;<br>Cc: Toby Thain
 &lt;toby@smartgames.ca&gt;; ReiserFS List &lt;reiserfs-list@namesys.com&gt;<br>Sent: Wednesday, May 30, 2007 1:03:14 PM<br>Subject: Re: Filesystem corruption<br><br><div>On Wednesday 30 May 2007 12:22:17 devsk wrote:<br><br>&gt; I have used R4 for a year now and I have had to reset my PC,<br>&gt; troubleshooting problems with vmware/mythtv/cisco vpn client/nvidia, so<br>&gt; many times that its not even funny! And R4 didn't give me any problems even<br>&gt; once. It boots right up, without any files lost and consistent FS as a<br>&gt; subsequent livecd boot and fsck proved it everytime.<br><br>That happened to me for maybe a year or so, I'm not sure. Then, slowly, I <br>started to get problems. The machine crashing due to some nvidia bug -- or <br>even a reiser-specific oops or something -- then I'd have to fsck it, which <br>would take an hour or more, then I'd boot, and apparently no 
 problems.<br><br>Only, recently, these fsck-a-thons started happening more and more
 often, and <br>I started to lose random files. They'd just be silently truncated to 0 bytes. <br>And not files I was writing a lot -- I'm talking about things <br>like /bin/mount.<br><br>Now, maybe it's an amd64-specific bug. Or (somehow) a dmraid-specific bug, or <br>a dont_load_bitmap bug. (Who can blame me; without dont_load_bitmap, it takes <br>at least 30 seconds, maybe a minute to mount.) Could even be, somehow, a <br>Gentoo-specific bug. Could be a 350-gig-partition bug, or even a bug of the <br>it-hates-me variety. (My server ran Reiser4 for awhile longer, with no <br>problems, but I wasn't about to take chances there.)<br><br>But, I switched a friend over to Ubuntu, and he had the same kind of problems. <br>In fact, he had them first (I thought it was his computer, for awhile).<br><br>Finally, we switched to stock Ubuntu kernels and XFS, me on dmraid, him on <br>normal linux ra
 id5 (md), and we now have no problems. It's even faster -- the <br>biggest gain for
 Reiser4 was /usr/portage, which doesn't exist on Ubuntu.<br><br>&gt; If I did that to ext <br>&gt; or xfs, I would have lost big time.<br><br>Well, I'm on XFS on my desktop now, and ext3 on my server. No problems at all <br>so far. Also much faster, because my desktop now has a repacker (xfs_fsr).<br><br>&gt; I hope people don't leave this good piece of code to rot!!<br><br>Me too, but you know, I can no longer afford to spend a few hours running fsck <br>for no apparent reason. I no longer have a machine that can do anything but <br>just work.<br><br>The killer feature of Reiser4, as implemented, is small file performance that <br>makes ReiserFSv3 weep, and v3 makes XFS weep. All the other stuff we were <br>promised is either planned for a later release (repacker, pseudofiles, <br>transaction API) or barely working (cryptocompress).<br><br>And on just about any setup I work on today, s
 mall file performance is a small <br>enough priority that even the slightest hint of
 instability is a <br>deal-breaker. Enough people feel the same way that ext3 is still widely used. <br>And if it's ever really crucial, there's reiserfs3.<br><br>So, you can blame it on my hardware, or on not getting kernel inclusion, or <br>anything you want, but the only place I still use Reiser4 is on the <br>gameserver at our LAN party, and we're thinking of moving that to something <br>like ext3 or xfs, just so we don't need custom kernels. And after all, that's <br>a gameserver, it's not like the filesystem is the bottleneck anyway.<br></div></div><br></div></div><br>
      <hr size=1>Get the Yahoo! toolbar and <a href="http://us.rd.yahoo.com/evt=48225/*http://new.toolbar.yahoo.com/toolbar/features/mail/index.php">be alerted to new email </a>wherever you're surfing. </body></html>
--0-104951430-1180556019=:40923--
