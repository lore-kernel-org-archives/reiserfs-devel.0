From: "darren" <teodarren@myrealbox.com>
Subject: RE: reiserfs vs NTFS vs WAFL
Date: Fri, 23 May 2003 21:07:12 +0800
Message-ID: <001401c3212c$3a375bd0$0101a8c0@bummer>
References: <3ECCEBD6.7090006@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3ECCEBD6.7090006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'Ragnar Kjorstad' <reiserfs@ragnark.vestdata.no>, 'reiserfs' <reiserfs-list@namesys.com>, 'Mike Jadon' <mikej@umem.com>

Hi Hans,

> This really surprises me.  Be sure to turn tails off when doing a
purely 
performance benchmark with V3.

I mounted the drive with the notails option during the test already.

> Sponsor a guy to work on it.;-)  Sorry, I know that you are probably 
much smaller than mp3.com and can't really cost justify that.  For a 
long time we have known that it would be nice to have someone tweak 
samba for reiserfs, but there is no funding for it (which is odd 
considering the practical/commercial import of such work).

You are so right!!!...i am just a student working on a school project!!!
While we have some funding...it is so limited we have to thrift on RAM,
and warranty for our servers....sigh...

But seriously, CIFS have a lot of commercial appeal now considering the
number of people who already bought NetApps to run their Databases on
windows.

Even running an enterprise or campus Fileserver, we cannot ignore the
people still in the matrix and running windoze.

Thanx for reiserfs really!


Rgds
darren

-----Original Message-----
From: Hans Reiser [mailto:reiser@namesys.com] 
Sent: Thursday, May 22, 2003 11:25 PM
To: darren
Cc: 'Ragnar Kjorstad'; 'reiserfs'; 'Mike Jadon'
Subject: Re: reiserfs vs NTFS vs WAFL

darren wrote:

>Hi all,
>
>Thanx for replying to my mail.
>
>I am doing some tests on this three FS now (to see if we would want to
>spend $$$$$ on a netapp).
>
>My test is based on the simultaneous creation and deletion of small
>files 50Kb, as per my actual usage of the file server for my
application
>servers.
>
>My main problem with using Linux/Reiserfs3 is with the performance of
>Samba when under heavy load. CIFS operation is required as some of our
>application servers are windows based. Netapp's CIFS performance is
>really incredible.
>
>With NFS, we can sometimes beat the netapp F87 with a
>Linux/ReiserFs/RAID0 config with the same number of harddisk.
>
This really surprises me.  Be sure to turn tails off when doing a purely

performance benchmark with V3.

>
>Will post more details when I thru with it.
>
>In the mean time, will really appreciate any suggestions to improving
>Samba's performance in order to make a CIFS file server based on
>Linux/Reiser/Samba possible.
>
Sponsor a guy to work on it.;-)  Sorry, I know that you are probably 
much smaller than mp3.com and can't really cost justify that.  For a 
long time we have known that it would be nice to have someone tweak 
samba for reiserfs, but there is no funding for it (which is odd 
considering the practical/commercial import of such work).

>
>-----Original Message-----
>From: Hans Reiser [mailto:reiser@namesys.com] 
>Sent: Thursday, May 22, 2003 2:14 AM
>To: darren
>Cc: 'reiserfs'; Mike Jadon
>Subject: Re: reiserfs vs NTFS vs WAFL
>
>darren wrote:
>
>  
>
>>Hi all,
>>
>>I wonder if there are any papers or benchmarks that compare the
>>performance and architectural differences between reiserfs, NTFS and
>>WAFL (NetApp's Write Anywhere File Layout)?
>>
>>Any help will be great.
>>
>>Regards
>>darren
>>
>>
>>
>> 
>>
>>    
>>
>I regret to say that all I can do is point you to my LinuxTag paper at 
>www.namesys.com/v4/reiser4_the_atomic_filesystem.html, and give you my 
>informal opinion that NTFS sucks but has improved a lot, and WAFL is 
>great for NFS.
>
>I'd be curious to see mongo numbers on NTFS if anyone has the energy.
>
>Most people comparing WAFL and ReiserFS look at the price per GB and we

>win without the benchmark ever being run.  mp3.com for instance 
>sponsored us so that they could save $22 million on Netapps and Suns. 
>
>I would expect WAFL to beat Linux/NFS/ReiserFS V3/RAID because that is 
>their niche and they are sharp and I bet their zero copy NFS code is 
>better than Linux's, but no one knows for real.  I would be curious to 
>see Reiser4 benchmarked against WAFL when we are done, especially if
you
>
>toss in some cards from umem that Mike sells.  ReiserFS might save some

>disk space compared to WAFL.
>
>I would expect NetApp to just blow away any NTFS server.... but I 
>haven't measured it.
>
>  
>


-- 
Hans



