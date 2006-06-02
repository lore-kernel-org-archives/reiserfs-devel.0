From: "Bill Rees" <wsrees@gmail.com>
Subject: Re: Bad Hardware / Software Disk Detection for Production Systems
Date: Fri, 2 Jun 2006 09:10:48 -0400
Message-ID: <8bdd70ae0606020610s1233668dgd6f53708d529e968@mail.gmail.com>
References: <8bdd70ae0606020521o177b840eya5580b511f3526a3@mail.gmail.com>
	 <20060602124045.GC16113@king.bitgnome.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1886_6472875.1149253848021"
Return-path: <reiserfs-list-return-28717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060602124045.GC16113@king.bitgnome.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Mark Nipper <nipsy@bitgnome.net>
Cc: reiserfs-list@namesys.com

------=_Part_1886_6472875.1149253848021
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Believe it or not, we aren't that concerned with data loss in this
application due to the way the data is stored on the disks.  We are more
concerned with the becoming unresponsive due to problems writing to the
filesystem. I would think that this could still happen in a RAID 5
implementation if the filesystem becomes corrupted. We haven't used RAID 5
in awhile but when we did, file system rebuilds that would take days were
not uncommon.

I am trying to maximize uptime and some data loss is not a problem.  Perhaps
redundant RAID 5 systems would be the only answer to this problem?

On 6/2/06, Mark Nipper <nipsy@bitgnome.net> wrote:
>
> On 02 Jun 2006, Bill Rees wrote:
> >    This is a general question but I thought I'd post it to the list to
> see if
> >    anyone has any suggestions.
>
>         You cannot expect any sort of data integrity if you are
> using JBOD mode on a RAID controller.  The very nature of JBOD
> means that any time a single drive fails, you lose every
> partition across that entire JBOD volume.
>
>         If your file systems are even coming back after such a
> catastrophe, you have been extremely fortunate to date.  I still
> cannot imagine that you aren't losing data though since there is
> no mirroring going on whatsoever which means blocks are
> inherently being lost during such failures.
>
>         If you are just looking for read performance, you should
> seriously consider at least a RAID 1 volume.  If you can
> sacrifice some overall performance, you will get the best space
> optimization by going with a RAID 5.  Anything more exotic than
> that, you should start at:
> ---
> http://en.wikipedia.org/wiki/Redundant_array_of_independent_disks
>
> and go with whichever level of RAID makes the most sense for your
> application.
>
>         The bottom line is, you are going to lose data in a JBOD
> array (unless you also happen to be doing some sort of software
> RAID on top of that).  There is really no gain through some sort
> of software trick to try to avoid the data loss.  SMART enabled
> hard drives may occasionally warn you of an imminent failure, but
> then again, they may not.  Drives will just occasionally fail
> entirely without any warning, hence the whole purpose of RAID
> levels above 0.
>
> --
> Mark Nipper                                                e-contacts:
> 832 Tanglewood Drive                                nipsy@bitgnome.net
> Bryan, Texas 77802-4013                     http://nipsy.bitgnome.net/
> (979)575-3193                      AIM/Yahoo: texasnipsy ICQ: 66971617
>
> -----BEGIN GEEK CODE BLOCK-----
> Version: 3.1
> GG/IT d- s++:+ a- C++$ UBL++++$ P--->+++ L+++$ !E---
> W++(--) N+ o K++ w(---) O++ M V(--) PS+++(+) PE(--)
> Y+ PGP t+ 5 X R tv b+++@ DI+(++) D+ G e h r++ y+(**)
> ------END GEEK CODE BLOCK------
>
> ---begin random quote of the moment---
> Anyone who is capable of getting themselves made President
> should on no account be allowed to do the job.
> -- Douglas Adams, _The Hitchhiker's Guide to the Galaxy_
> ----end random quote of the moment----
>

------=_Part_1886_6472875.1149253848021
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Believe it or not, we aren't that concerned with data loss in this application due to the way the data is stored on the disks.&nbsp; We are more concerned with the becoming unresponsive due to problems writing to the filesystem. I would think that this could still happen in a RAID 5 implementation if the filesystem becomes corrupted. We haven't used RAID 5 in awhile but when we did, file system rebuilds that would take days were not uncommon. 
<br><br>I am trying to maximize uptime and some data loss is not a problem.&nbsp; Perhaps redundant RAID 5 systems would be the only answer to this problem?<br><br><div><span class="gmail_quote">On 6/2/06, <b class="gmail_sendername">
Mark Nipper</b> &lt;<a href="mailto:nipsy@bitgnome.net">nipsy@bitgnome.net</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On 02 Jun 2006, Bill Rees wrote:<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;This is a general question but I thought I'd post it to the list to see if<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;anyone has any suggestions.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You cannot expect any sort of data integrity if you are
<br>using JBOD mode on a RAID controller.&nbsp;&nbsp;The very nature of JBOD<br>means that any time a single drive fails, you lose every<br>partition across that entire JBOD volume.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If your file systems are even coming back after such a
<br>catastrophe, you have been extremely fortunate to date.&nbsp;&nbsp;I still<br>cannot imagine that you aren't losing data though since there is<br>no mirroring going on whatsoever which means blocks are<br>inherently being lost during such failures.
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you are just looking for read performance, you should<br>seriously consider at least a RAID 1 volume.&nbsp;&nbsp;If you can<br>sacrifice some overall performance, you will get the best space<br>optimization by going with a RAID 5.&nbsp;&nbsp;Anything more exotic than
<br>that, you should start at:<br>---<br><a href="http://en.wikipedia.org/wiki/Redundant_array_of_independent_disks">http://en.wikipedia.org/wiki/Redundant_array_of_independent_disks</a><br><br>and go with whichever level of RAID makes the most sense for your
<br>application.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The bottom line is, you are going to lose data in a JBOD<br>array (unless you also happen to be doing some sort of software<br>RAID on top of that).&nbsp;&nbsp;There is really no gain through some sort
<br>of software trick to try to avoid the data loss.&nbsp;&nbsp;SMART enabled<br>hard drives may occasionally warn you of an imminent failure, but<br>then again, they may not.&nbsp;&nbsp;Drives will just occasionally fail<br>entirely without any warning, hence the whole purpose of RAID
<br>levels above 0.<br><br>--<br>Mark Nipper&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e-contacts:<br>832 Tanglewood Drive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="mailto:nipsy@bitgnome.net">nipsy@bitgnome.net</a><br>
Bryan, Texas 77802-4013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://nipsy.bitgnome.net/">http://nipsy.bitgnome.net/</a><br>(979)575-3193&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AIM/Yahoo: texasnipsy ICQ: 66971617<br><br>-----BEGIN GEEK CODE BLOCK-----
<br>Version: 3.1<br>GG/IT d- s++:+ a- C++$ UBL++++$ P---&gt;+++ L+++$ !E---<br>W++(--) N+ o K++ w(---) O++ M V(--) PS+++(+) PE(--)<br>Y+ PGP t+ 5 X R tv b+++@ DI+(++) D+ G e h r++ y+(**)<br>------END GEEK CODE BLOCK------
<br><br>---begin random quote of the moment---<br>Anyone who is capable of getting themselves made President<br>should on no account be allowed to do the job.<br> -- Douglas Adams, _The Hitchhiker's Guide to the Galaxy_<br>
----end random quote of the moment----<br></blockquote></div><br>

------=_Part_1886_6472875.1149253848021--
