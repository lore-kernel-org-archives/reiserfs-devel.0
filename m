From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 19:46:41 -0400
Message-ID: <412298E1.4080100@comcast.net>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com> <41225C9C.7050400@comcast.net> <41226A50.3010609@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------020209080901020405020301"
Return-path: <reiserfs-list-return-20365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41226A50.3010609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------020209080901020405020301
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


First, rereading my e-mails I realize that there was some thinking 
behind my questions
which was only partially articulated.  Going back to my earlier position 
which I will restate
here as:

    /Use of a mask should never corrupt the semantics defined by the
    Single Unix
    Specification /*or*/ its practical derivations and extensions, e.g.,
    BSD and Linux./

That is,/ ideally/ if I created a standalone system that "looked" like 
the system the mask
provides then the process would behave equivalently.  I emphasize 
ideally because to
actually make that the case would require something closer to a virtual 
machine---which
is clearly beyond the scope of this project.

So I am looking for potential semantic anomalies which could be 
introduced by a
mask over a reiser4 file system, i.e., border cases where some upfront 
awareness
and attention may save re-design and re-writing later on.


Hans Reiser wrote:

>
>> The issue is how the mask might change the semantics of 
>> sys_execve().  I have spent some time
>> starting to trace code around, but more work is required.
>>
>> For the moment I think we are safe if the setuid and setgroup can not 
>> be altered by the mask.
>
>
> Ok.


For the moment I will focus on how the uid (and assume the group id will 
be similar)
of a process and how the mask might lead to a different uid than would 
be expected
under standard semantics.

So we agree that the process has an associated user: actually there is 
the concept
of real and effective uid also.

I believe the statement above to be true if the process never makes a 
setuid() system's call of
one flavor or another because the uid is inherited from the process 
calling execev() or is determined
by the owner of the executable if the executable's file set-uid 
permission bit is turned on via chmod.

>>
>> We only change the semantics if the real/effective uid or gid is 
>> different at some point in the
>> processes execution because of the mask---begging situations where a 
>> call to setuid happens
>> only if a certain file is not available.
>
>
> Say more.

If the process has the code like

    if (stat("/etc/foobar.conf", statbuf)  < 0) {
         if (setuid(3) < 0) {   /* Try to become sys */
        }
        /* Do something here */
    }

And the mask hides "/etc/foobar.conf" then in fact the uid
will change but *not unexpectedly*, IMO.  The mask is
creating a changed environment but the behavior is
understandable from the source code.

Put this another way, the semantics still seem correct to me
because you are getting the behavior of "/etc/foobar.conf" actually
not being there.

Now that I think about it masking a named pipe or a lock file
is perhaps more likely to cause problems then the setuid bit.
More cogitation required...  :-)



--------------020209080901020405020301
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
First, rereading my e-mails I realize that there was some thinking
behind my questions<br>
which was only partially articulated.&nbsp; Going back to my earlier
position which I will restate<br>
here as:<br>
<blockquote><i>Use of a mask should never corrupt the semantics defined
by the Single Unix<br>
Specification </i><b>or</b><i> its practical derivations and
extensions, e.g., BSD and Linux.</i><br>
</blockquote>
That is,<i> ideally</i> if I created a standalone system that "looked"
like the system the mask<br>
provides then the process would behave equivalently.&nbsp; I emphasize
ideally because to<br>
actually make that the case would require something closer to a virtual
machine---which<br>
is clearly beyond the scope of this project.<br>
<br>
So I am looking for potential semantic anomalies which could be
introduced by a<br>
mask over a reiser4 file system, i.e., border cases where some upfront
awareness<br>
and attention may save re-design and re-writing later on.<br>
<br>
<br>
Hans Reiser wrote:<br>
<blockquote type="cite" cite="mid41226A50.3010609@namesys.com"><br>
  <blockquote type="cite">The issue is how the mask might change the
semantics of sys_execve().&nbsp; I have spent some time
    <br>
starting to trace code around, but more work is required.
    <br>
    <br>
For the moment I think we are safe if the setuid and setgroup can not
be altered by the mask.
    <br>
  </blockquote>
  <br>
Ok.
  <br>
</blockquote>
<br>
For the moment I will focus on how the uid (and assume the group id
will be similar)<br>
of a process and how the mask might lead to a different uid than would
be expected<br>
under standard semantics.<br>
<br>
So we agree that the process has an associated user: actually there is
the concept<br>
of real and effective uid also.<br>
<br>
I believe the statement above to be true if the process never makes a
setuid() system's call of<br>
one flavor or another because the uid is inherited from the process
calling execev() or is determined<br>
by the owner of the executable if the executable's file set-uid
permission bit is turned on via chmod.<br>
<blockquote type="cite" cite="mid41226A50.3010609@namesys.com">
  <blockquote type="cite"><br>
We only change the semantics if the real/effective uid or gid is
different at some point in the
    <br>
processes execution because of the mask---begging situations where a
call to setuid happens
    <br>
only if a certain file is not available.
    <br>
  </blockquote>
  <br>
Say more.
  <br>
</blockquote>
If the process has the code like<br>
<blockquote>if (stat("/etc/foobar.conf", statbuf)&nbsp; &lt; 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (setuid(3) &lt; 0) {&nbsp;&nbsp; /* Try to become sys */<br>
&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp; /* Do something here */<br>
}<br>
</blockquote>
And the mask hides "/etc/foobar.conf" then in fact the uid<br>
will change but <b>not unexpectedly</b>, IMO.&nbsp; The mask is<br>
creating a changed environment but the behavior is<br>
understandable from the source code.<br>
<br>
Put this another way, the semantics still seem correct to me<br>
because you are getting the behavior of "/etc/foobar.conf" actually<br>
not being there.<br>
<br>
Now that I think about it masking a named pipe or a lock file<br>
is perhaps more likely to cause problems then the setuid bit.<br>
More cogitation required...&nbsp; <span class="moz-smiley-s1"><span> :-) </span></span><br>
<br>
<br>
</body>
</html>

--------------020209080901020405020301--

