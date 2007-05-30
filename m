From: devsk <funtoos@yahoo.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 10:22:17 -0700 (PDT)
Message-ID: <160382.11806.qm@web31708.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1959394957-1180545737=:11806"
Return-path: <reiserfs-list-return-30671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Toby Thain <toby@smartgames.ca>, David Masover <ninja@slaphack.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--0-1959394957-1180545737=:11806
Content-Type: text/plain; charset=ascii

I think people just like to spread FUD without doing any analysis of what really caused the FS corruption. It can be anything from a bad 3rd party driver to bad hardware ('bad blocks', does anybody check for them before mkfs these days? I do). People also like to try those untested patchsets, containing every blah that's thrown out by so called 'kernel hackers' which makes your system 10x faster. Rieser4 seems like an easy candidate to vent their anger on afterwards.

I have used R4 for a year now and I have had to reset my PC, troubleshooting problems with vmware/mythtv/cisco vpn client/nvidia, so many times that its not even funny! And R4 didn't give me any problems even once. It boots right up, without any files lost and consistent FS as a subsequent livecd boot and fsck proved it everytime. If I did that to ext or xfs, I would have lost big time. Only files I have ever lost were on ext3 during a sudden power failure. I don't trust safety of my data on any FS but Rieserfs. I hope people don't leave this good piece of code to rot!!

-devsk

----- Original Message ----
From: Toby Thain <toby@smartgames.ca>
To: David Masover <ninja@slaphack.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>
Sent: Wednesday, May 30, 2007 9:42:01 AM
Subject: Re: Filesystem corruption


On 30-May-07, at 10:25 AM, David Masover wrote:

> On Tuesday 29 May 2007 07:36:13 Toby Thain wrote:
>
>>>> but you can't
>>>> mention using reiserfs in mixed company without someone accusing
>>>> you of
>>>> throwing your data away.
>>
>> People who repeat this rarely have any direct experience of Reiser;
>> they repeat what they've heard; like all myths and legends they are
>> transmitted orally rather than based on scientific observation.
>
> Well, there is one problem I vaguely remember that I don't think  
> has been
> addressed, I think it was one of those lets-put-it-off-till-v4  
> things. It was
> the fact that there are a limited number of inodes (or keys, or  
> whatever you
> call a unique file),

But does it cause data loss? One usually sees claims that "reiserfs  
ate my data", or "I heard reiserfs ate somebody's data", but without  
supplying a root cause - bad memory? powerfail? bad disk? etc.

> and no way of knowing how many you have left until your
> FS will suddenly, one day refuse to create another file.
>

> ... switching away from Reiser4
> means I no longer see random files (including stuff in, for  
> example, /sbin,
> that I hadn't touched in months) go up in smoke.

I only wish sanity had prevailed over  kernel inclusion, then we'd  
see it shaken down a lot quicker, like R3 was.

>
> Ordinarily I like to help debug things, but not at the risk of my  
> data. Maybe
> I'll try again later, and see if I can reproduce it in a VM or  
> somewhere
> safe...
>
> I do still follow the list, though, in case something interesting  
> happens.

Yeah, R4 is "something interesting". :) I still hope it gets finished...

--Toby

> It
> was fun while it lasted!








       
____________________________________________________________________________________Boardwalk for $500? In 2007? Ha! Play Monopoly Here and Now (it's updated for today's economy) at Yahoo! Games.
http://get.games.yahoo.com/proddesc?gamekey=monopolyherenow  
--0-1959394957-1180545737=:11806
Content-Type: text/html; charset=ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;">I think people just like to spread FUD without doing any analysis of what really caused the FS corruption. It can be anything from a bad 3rd party driver to bad hardware ('bad blocks', does anybody check for them before mkfs these days? I do). People also like to try those untested patchsets, containing every blah that's thrown out by so called 'kernel hackers' which makes your system 10x faster. Rieser4 seems like an easy candidate to vent their anger on afterwards.<br><br>I have used R4 for a year now and I have had to reset my PC, troubleshooting problems with vmware/mythtv/cisco vpn client/nvidia, so many times that its not even funny! And R4 di
 dn't give me any problems even once. It boots right up, without any files lost and
 consistent FS as a subsequent livecd boot and fsck proved it everytime. If I did that to ext or xfs, I would have lost big time. Only files I have ever lost were on ext3 during a sudden power failure. I don't trust safety of my data on any FS but Rieserfs. I hope people don't leave this good piece of code to rot!!<br><br>-devsk<br><br><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;">----- Original Message ----<br>From: Toby Thain &lt;toby@smartgames.ca&gt;<br>To: David Masover &lt;ninja@slaphack.com&gt;<br>Cc: ReiserFS List &lt;reiserfs-list@namesys.com&gt;<br>Sent: Wednesday, May 30, 2007 9:42:01 AM<br>Subject: Re: Filesystem corruption<br><br><div><br>On 30-May-07, at 10:25 AM, David Masover wrote:<br><br>&gt; On Tuesday 29 May 2007 07:36:13 Toby Thain wrote:<br>&gt;<br>&gt;&gt;&gt;&gt; but you can't<br>&gt;&gt;&gt;&gt; mention using reiserfs in mixed c
 ompany without someone accusing<br>&gt;&gt;&gt;&gt; you of<br>&gt;&gt;&gt;&gt; throwing
 your data away.<br>&gt;&gt;<br>&gt;&gt; People who repeat this rarely have any direct experience of Reiser;<br>&gt;&gt; they repeat what they've heard; like all myths and legends they are<br>&gt;&gt; transmitted orally rather than based on scientific observation.<br>&gt;<br>&gt; Well, there is one problem I vaguely remember that I don't think&nbsp;&nbsp;<br>&gt; has been<br>&gt; addressed, I think it was one of those lets-put-it-off-till-v4&nbsp;&nbsp;<br>&gt; things. It was<br>&gt; the fact that there are a limited number of inodes (or keys, or&nbsp;&nbsp;<br>&gt; whatever you<br>&gt; call a unique file),<br><br>But does it cause data loss? One usually sees claims that "reiserfs&nbsp;&nbsp;<br>ate my data", or "I heard reiserfs ate somebody's data", but without&nbsp;&nbsp;<br>supplying a root cause - bad memory? powerfail? bad disk? etc.<br><br>&gt; and no way of knowing how many you h
 ave left until your<br>&gt; FS will suddenly, one day refuse to create another
 file.<br>&gt;<br><br>&gt; ... switching away from Reiser4<br>&gt; means I no longer see random files (including stuff in, for&nbsp;&nbsp;<br>&gt; example, /sbin,<br>&gt; that I hadn't touched in months) go up in smoke.<br><br>I only wish sanity had prevailed over&nbsp;&nbsp;kernel inclusion, then we'd&nbsp;&nbsp;<br>see it shaken down a lot quicker, like R3 was.<br><br>&gt;<br>&gt; Ordinarily I like to help debug things, but not at the risk of my&nbsp;&nbsp;<br>&gt; data. Maybe<br>&gt; I'll try again later, and see if I can reproduce it in a VM or&nbsp;&nbsp;<br>&gt; somewhere<br>&gt; safe...<br>&gt;<br>&gt; I do still follow the list, though, in case something interesting&nbsp;&nbsp;<br>&gt; happens.<br><br>Yeah, R4 is "something interesting". :) I still hope it gets finished...<br><br>--Toby<br><br>&gt; It<br>&gt; was fun while it lasted!<br><br></div></div><br></div></div><br>
      <hr size=1>Choose the right car based on your needs.  
Check out <a href="http://us.rd.yahoo.com/evt=48518/*http://autos.yahoo.com/carfinder/;_ylc=X3oDMTE3NWsyMDd2BF9TAzk3MTA3MDc2BHNlYwNtYWlsdGFncwRzbGsDY2FyLWZpbmRlcg-- ">Yahoo! Autos new Car Finder tool.</a>
</body></html>
--0-1959394957-1180545737=:11806--
