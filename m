From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Sun, 15 Aug 2004 21:48:02 -0400
Message-ID: <41201252.1080803@comcast.net>
References: <411FFCB4.2060400@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080004060406040309090006"
Return-path: <reiserfs-list-return-20316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411FFCB4.2060400@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------080004060406040309090006
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


First a little (*/tentatively/*) suggested terminology---translation of 
(/tentatively/) I stand
behind it until I begin to suspect I've made a mistake and then I change 
sides ;-) :

1) A *mask *consists of a set of *prescriptions *(trying to avoid rule) 
which defines a
   / subset/ of permissible functionality for a file system.

2) The *permissible functionality *of a file system is roughly speaking, 
the ACLs
    for all the objects in the file system.

    Actually, I think this is a good place to start, because the type 
"permissible
    functionality" is in fact what the mask is applied to and what is 
returned.
   Grant you evaluation is done lazily as the execution of an 
application requires it.

3)  A user and group instantiated mask forms an *operational set of 
functionality*.

     What is important here is to recognize that a given executable may have
     different apparent functionality based on who is running it.

     To make this concept clearer, consider the possibility that group 
write access
     to a file might be elided (masked away) by the some prescription 
for a user
     who otherwise might have add access---but the user's privileges are 
limited
     by the executable.



Hans Reiser wrote:

> It is very important that we have something simple that reuses code 
> for this purpose, and it also needs to be scalable.  That is, we need 
> to be able to determine in insignificant time whether a file passes 
> through a mask consisting of a million files.

A million files or a million rules?  A single rule may give access to a 
million files and
    require only constant time to evaluate.

> One approach would be to use a format similar to that for chroot, that 
> is, to keep the format we use for directory trees now, and use it for 
> storing the mask.  This raises the question: how would the format for 
> the mask differ from that of the underlying filesystem.
>
> Another approach is to use stem compressed names, or some other unique 
> within the fs format for the mask.

Can you elaborate on this for a newbie

>
> We need to be able to support specifying a mask that allows any file 
> within a given directory to be visible.  That is, we need to support 
> dirname/* but we don't yet need to support dirname/foo.*

NB.  Hans and I had discussed limiting access to 'hidden files' 
informally:  '..' in particular needs some
special attention although it would be best not to have a special case 
if we can avoid it.

>
> We probably don't want to allow symbolic links to be followed unless 
> where they point to is within the mask.

Agreed.

> I want minimal code but I want it to be treelike in its performance 
> scalability.
>
> Ideas?

Well, for the moment only more questions:

Suppose we have a file system and a mask.  If we were to create a chroot 
by copying just
the file system accessible through the mask and run the application in 
that environment
would the semantics of running the application on the original file 
system with the mask
by equivalent.  By equivalent I mean no observable difference in the 
instructions executed
at the user level or the output generated.

Does the question make sense?


--------------080004060406040309090006
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
First a little (<b><i>tentatively</i></b>) suggested
terminology---translation of (<i>tentatively</i>) I stand<br>
behind it until I begin to suspect I've made a mistake and then I
change sides <span class="moz-smiley-s3"><span> ;-) </span></span>:<br>
<br>
1) A <b>mask </b>consists of a set of <b>prescriptions </b>(trying
to avoid rule) which defines a<br>
&nbsp;&nbsp;&nbsp;<i> subset</i> of permissible functionality for a file system.<br>
<br>
2) The <b>permissible functionality </b>of a file system is roughly
speaking, the ACLs<br>
&nbsp;&nbsp;&nbsp; for all the objects in the file system.<br>
<br>
&nbsp;&nbsp;&nbsp; Actually, I think this is a good place to start, because the type
"permissible<br>
&nbsp; &nbsp; functionality" is in fact what the mask is applied to and what is
returned.<br>
&nbsp;&nbsp; Grant you evaluation is done lazily as the execution of an
application requires it.<br>
<br>
3)&nbsp; A user and group instantiated mask forms an <b>operational set of
functionality</b>.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; What is important here is to recognize that a given executable may
have<br>
&nbsp;&nbsp;&nbsp;&nbsp; different apparent functionality based on who is running it.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; To make this concept clearer, consider the possibility that group
write access<br>
&nbsp; &nbsp;&nbsp; to a file might be elided (masked away) by the some prescription
for a user<br>
&nbsp;&nbsp;&nbsp;&nbsp; who otherwise might have add access---but the user's privileges
are limited<br>
&nbsp;&nbsp;&nbsp;&nbsp; by the executable.<br>
<br>
<br>
<br>
Hans Reiser wrote:<br>
<blockquote type="cite" cite="mid411FFCB4.2060400@namesys.com">It is
very important that we have something simple that reuses code for this
purpose, and it also needs to be scalable.&nbsp; That is, we need to be able
to determine in insignificant time whether a file passes through a mask
consisting of a million files.
  <br>
</blockquote>
A million files or a million rules?&nbsp; A single rule may give access to a
million files and<br>
&nbsp;&nbsp;&nbsp; require only constant time to evaluate.<br>
<blockquote type="cite" cite="mid411FFCB4.2060400@namesys.com">One
approach would be to use a format similar to that for chroot, that is,
to keep the format we use for directory trees now, and use it for
storing the mask.&nbsp; This raises the question: how would the format for
the mask differ from that of the underlying filesystem.
  <br>
  <br>
Another approach is to use stem compressed names, or some other unique
within the fs format for the mask.
  <br>
</blockquote>
Can you elaborate on this for a newbie <br>
<blockquote type="cite" cite="mid411FFCB4.2060400@namesys.com"><br>
We need to be able to support specifying a mask that allows any file
within a given directory to be visible.&nbsp; That is, we need to support
dirname/* but we don't yet need to support dirname/foo.*
  <br>
</blockquote>
NB.&nbsp; Hans and I had discussed limiting access to 'hidden files'
informally:&nbsp; '..' in particular needs some<br>
special attention although it would be best not to have a special case
if we can avoid it.<br>
<blockquote type="cite" cite="mid411FFCB4.2060400@namesys.com"><br>
We probably don't want to allow symbolic links to be followed unless
where they point to is within the mask.
  <br>
</blockquote>
Agreed.<br>
<blockquote type="cite" cite="mid411FFCB4.2060400@namesys.com">I want
minimal code but I want it to be treelike in its performance
scalability.
  <br>
  <br>
Ideas?
  <br>
</blockquote>
Well, for the moment only more questions:<br>
<br>
Suppose we have a file system and a mask.&nbsp; If we were to create a
chroot by copying just<br>
the file system accessible through the mask and run the application in
that environment<br>
would the semantics of running the application on the original file
system with the mask<br>
by equivalent.&nbsp; By equivalent I mean no observable difference in the
instructions executed<br>
at the user level or the output generated.<br>
<br>
Does the question make sense?<br>
<br>
</body>
</html>

--------------080004060406040309090006--

