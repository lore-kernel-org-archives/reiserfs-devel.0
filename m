From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Mon, 16 Aug 2004 15:50:13 -0400
Message-ID: <41210FF5.7080605@comcast.net>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030108010909050100030500"
Return-path: <reiserfs-list-return-20341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412015D0.8030806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------030108010909050100030500
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Hans Reiser wrote:

> George Beshers wrote:
>
>> 2) The *permissible functionality *of a file system is roughly 
>> speaking, the ACLs
>>     for all the objects in the file system.
>>
>>     Actually, I think this is a good place to start, because the type 
>> "permissible
>>     functionality" is in fact what the mask is applied to and what is 
>> returned.
>>    Grant you evaluation is done lazily as the execution of an 
>> application requires it.
>>
> Yes.

I have started re-reading withe Single UNIX Specification with getting a 
working
definition of permissible functionality in mind.  Have not gotten to 
Usenix papers
yet or a careful search of ACM.

Does anyone think there is a better starting point?  Or things that are 
particularly
important to consider?

>
>> 3)  A user and group instantiated mask forms an *operational set of 
>> functionality*.
>>
>>      What is important here is to recognize that a given executable 
>> may have
>>      different apparent functionality based on who is running it.
>
>
> I think not in our particular niche.  We do process oriented security, 
> and that is all for now.  Later we can make it more complex.

We can't avoid it at some level without re-writing Linux security.  Take 
a moment to consider
the set-UID bit on a file which is an executable and I think you will 
see what I am driving at.

That said, all we need to do is make our specification conform to the 
smallest code change
for the time being, e.g., the identity mask---what was happening before 
is what you get.

NB.  I understand that the overriding goal of the first 3 months is 
devising and demonstrating
that we have a strategy that scales to file systems containing millions 
of files---but I don't
think we can lose any semantics as fundamental as user/group permissions 
without inviting
criticism.


>
>>
>>
>>
>> Well, for the moment only more questions:
>>
>> Suppose we have a file system and a mask.  If we were to create a 
>> chroot by copying just
>> the file system 
>
>
> semantic tree (not files, just filenames)
>
>> accessible through the mask and run the application in that environment
>> would the semantics of running the application on the original file 
>> system with the mask
>> by equivalent.  By equivalent I mean no observable difference in the 
>> instructions executed
>> at the user level or the output generated.
>
>
> No, because new files might be made visible through the mask without 
> the new file creator even being aware that there was a mask.

I don't think my question was very clear ...

For any process, could that process determine if it was running

    * on a reiser4 file system that is really the root
    * on a reiser4 file system with a mask, or
    * on a reiser4 file system with chroot

/exclusively/ by making calls to the reiser4 file system?

>
>>
>> Does the question make sense?
>
Uh no... :-[


--------------030108010909050100030500
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
<br>
Hans Reiser wrote:<br>
<blockquote type="cite" cite="mid412015D0.8030806@namesys.com">George
Beshers wrote:
  <br>
  <br>
  <blockquote type="cite">2) The *permissible functionality *of a file
system is roughly speaking, the ACLs
    <br>
&nbsp;&nbsp;&nbsp; for all the objects in the file system.
    <br>
    <br>
&nbsp;&nbsp;&nbsp; Actually, I think this is a good place to start, because the type
"permissible
    <br>
&nbsp;&nbsp;&nbsp; functionality" is in fact what the mask is applied to and what is
returned.
    <br>
&nbsp;&nbsp; Grant you evaluation is done lazily as the execution of an
application requires it.
    <br>
    <br>
  </blockquote>
Yes.
  <br>
</blockquote>
I have started re-reading withe Single UNIX Specification with getting
a working<br>
definition of permissible functionality in mind.&nbsp; Have not gotten to
Usenix papers<br>
yet or a careful search of ACM.<br>
<br>
Does anyone think there is a better starting point?&nbsp; Or things that are
particularly<br>
important to consider?<br>
<blockquote type="cite" cite="mid412015D0.8030806@namesys.com"><br>
  <blockquote type="cite">3)&nbsp; A user and group instantiated mask forms
an *operational set of functionality*.
    <br>
    <br>
&nbsp;&nbsp;&nbsp;&nbsp; What is important here is to recognize that a given executable may
have
    <br>
&nbsp;&nbsp;&nbsp;&nbsp; different apparent functionality based on who is running it.
    <br>
  </blockquote>
  <br>
I think not in our particular niche.&nbsp; We do process oriented security,
and that is all for now.&nbsp; Later we can make it more complex.
  <br>
</blockquote>
We can't avoid it at some level without re-writing Linux security.&nbsp;
Take a moment to consider<br>
the set-UID bit on a file which is an executable and I think you will
see what I am driving at.<br>
<br>
That said, all we need to do is make our specification conform to the
smallest code change<br>
for the time being, e.g., the identity mask---what was happening before
is what you get.<br>
<br>
NB.&nbsp; I understand that the overriding goal of the first 3 months is
devising and demonstrating<br>
that we have a strategy that scales to file systems containing millions
of files---but I don't<br>
think we can lose any semantics as fundamental as user/group
permissions without inviting<br>
criticism.<br>
<br>
<br>
<blockquote type="cite" cite="mid412015D0.8030806@namesys.com"><br>
  <blockquote type="cite"><br>
    <br>
  </blockquote>
  <blockquote type="cite"><br>
Well, for the moment only more questions:
    <br>
    <br>
Suppose we have a file system and a mask.&nbsp; If we were to create a
chroot by copying just
    <br>
the file system </blockquote>
  <br>
semantic tree (not files, just filenames)
  <br>
  <br>
  <blockquote type="cite">accessible through the mask and run the
application in that environment
    <br>
would the semantics of running the application on the original file
system with the mask
    <br>
by equivalent.&nbsp; By equivalent I mean no observable difference in the
instructions executed
    <br>
at the user level or the output generated.
    <br>
  </blockquote>
  <br>
No, because new files might be made visible through the mask without
the new file creator even being aware that there was a mask.
  <br>
</blockquote>
I don't think my question was very clear ...<br>
<br>
For any process, could that process determine if it was running<br>
<ul>
  <li>on a reiser4 file system that is really the root<br>
  </li>
  <li>on a reiser4 file system with a mask, or<br>
  </li>
  <li>on a reiser4 file system with chroot</li>
</ul>
<i>exclusively</i> by making calls to the reiser4 file system?<br>
<br>
<blockquote type="cite" cite="mid412015D0.8030806@namesys.com"><br>
  <blockquote type="cite"><br>
Does the question make sense?
    <br>
  </blockquote>
</blockquote>
Uh no... <span class="moz-smiley-s6"><span> :-[ </span></span><br>
<br>
</body>
</html>

--------------030108010909050100030500--

