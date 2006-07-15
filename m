From: "Ryan Steffes" <rbsteffes@gmail.com>
Subject: Re: [mythtv-users] Permission denied to ls for root?
Date: Fri, 14 Jul 2006 21:50:32 -0400
Message-ID: <674c6cd30607141850x4ecf5d6bhd16c35481aaca1ff@mail.gmail.com>
References: <674c6cd30607141802p3fb2a0d0g9e5271c8c801ee29@mail.gmail.com>
	 <1ba87a1f0607141831q5f623790q92b94a4f7602c751@mail.gmail.com>
	 <44B847E7.8020501@thirdcontact.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_65982_2504897.1152928232414"
Return-path: <reiserfs-list-return-29009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B847E7.8020501@thirdcontact.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Discussion about mythtv <mythtv-users@mythtv.org>, reiserfs-list@namesys.com

------=_Part_65982_2504897.1152928232414
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/14/06, Michael T. Dean <mtdean@thirdcontact.com> wrote:
>
> On 07/14/2006 09:31 PM, Carl Fongheiser wrote:
> > On 7/14/06, *Ryan Steffes* <rbsteffes@gmail.com
> > <mailto:rbsteffes@gmail.com>> wrote:
> >
> >     I've never seen ls do this before, at least, not for root.  Any
> >     idea what could cause it?
> >
> >     # ls
> >     ls: 1036_20060417230000_20060417233000.nuv.png: Permission denied
> >     ls: 1056_20060610130000.mpg: Permission denied
> >     ls: 1006_20050920213000_20050920220000.nuv.png: Permission denied
> >     ls: 1013_20060420201900_20060420203000.nuv: Permission denied
> >     ls: 1003_20060419220000_20060419230000.nuv.png: Permission denied
> >
> >     Can't delete em, look at em, touch em, chmod em, or chown em, even
> >     as root.  It's odd.
> >
> >
> > Are these files on a remote NFS share?   If so, that's not unusual.
> > Root is usually mapped to "nobody" on remote NFS servers.
>
> Or, it could happen because of a stale NFS file handle (fixable by
> unmounting/remounting).
>
> Mike
> _______________________________________________
> mythtv-users mailing list
> mythtv-users@mythtv.org
> http://mythtv.org/cgi-bin/mailman/listinfo/mythtv-users
>


It appears the answer I may have to go with is some sort of corruption in
the file system.  I'm CCing this to the reiserfs list, since that's what the
partition is.  On reboot, the partition starts to load, and hangs up on
"Checking Internal Tree.." and gets no further.

Any suggestions on how to recover without losing all my data?

Ryan

------=_Part_65982_2504897.1152928232414
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 7/14/06, <b class="gmail_sendername">Michael T. Dean</b> &lt;<a href="mailto:mtdean@thirdcontact.com">mtdean@thirdcontact.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On 07/14/2006 09:31 PM, Carl Fongheiser wrote:<br>&gt; On 7/14/06, *Ryan Steffes* &lt;<a href="mailto:rbsteffes@gmail.com">rbsteffes@gmail.com</a><br>&gt; &lt;mailto:<a href="mailto:rbsteffes@gmail.com">rbsteffes@gmail.com
</a>&gt;&gt; wrote:<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; I've never seen ls do this before, at least, not for root.&nbsp;&nbsp;Any<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; idea what could cause it?<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; # ls<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; ls: 1036_20060417230000_20060417233000.nuv.png: Permission denied
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; ls: 1056_20060610130000.mpg: Permission denied<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; ls: 1006_20050920213000_20050920220000.nuv.png: Permission denied<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; ls: 1013_20060420201900_20060420203000.nuv: Permission denied<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; ls: 1003_20060419220000_20060419230000.nuv.png: Permission denied
<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; Can't delete em, look at em, touch em, chmod em, or chown em, even<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; as root.&nbsp;&nbsp;It's odd.<br>&gt;<br>&gt;<br>&gt; Are these files on a remote NFS share?&nbsp;&nbsp; If so, that's not unusual.<br>&gt; Root is usually mapped to &quot;nobody&quot; on remote NFS servers.
<br><br>Or, it could happen because of a stale NFS file handle (fixable by<br>unmounting/remounting).<br><br>Mike<br>_______________________________________________<br>mythtv-users mailing list<br><a href="mailto:mythtv-users@mythtv.org">
mythtv-users@mythtv.org</a><br><a href="http://mythtv.org/cgi-bin/mailman/listinfo/mythtv-users">http://mythtv.org/cgi-bin/mailman/listinfo/mythtv-users</a><br></blockquote></div><br><br>It appears the answer I may have to go with is some sort of corruption in the file system.&nbsp; I'm CCing this to the reiserfs list, since that's what the partition is.&nbsp; On reboot, the partition starts to load, and hangs up on &quot;Checking Internal Tree..&quot; and gets no further.
<br><br>Any suggestions on how to recover without losing all my data?<br><br>Ryan<br><br><br>

------=_Part_65982_2504897.1152928232414--
