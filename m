From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 08:48:20 -0400
Message-ID: <4124A194.3030902@comcast.net>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com> <4123E3C9.90006@comcast.net> <4123F77C.6060703@namesys.com> <41240A04.7000502@comcast.net> <41243FA3.1010609@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030109060106050904040804"
Return-path: <reiserfs-list-return-20401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41243FA3.1010609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

--------------030109060106050904040804
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Hans Reiser wrote:

> George Beshers wrote:
>
>>
>> Ah... my language design background gets us into communication 
>> trouble :-)
>>
>> Suppose for a moment that exclude actually added functionality (as 
>> for example
>> regular expressions over file names will) what terminology would you 
>> use?
>> You see, to me the exclude is, at some level, little more than 
>> syntactic sugar
>> for the specification tools because the expressive power is 
>> equivalent in theory
>> even if using exclusion is much more convenient in practice.
>
>
> Do you consider the various turing complete languages to have 
> significant semantic differences?

Yes, but I understand your point.

The distinction I am drawing is that something is syntactic sugar if 
there is an
algorithm to translate some syntactic construct into a subset of a language
with more primitive attributes, e.g., 'elseif' is syntactic sugar.

Assume the alphabet is lower case letters for simplicity.

    exclude "bar"

becomes

    include ".|..|[ac-z][b-z][a-qs-z]|...+"

A moments thought and you will see that both can be implemented with
5 state finite state autometa (adding a failure/success state as the 5th 
state
with entire alphabet transitioning to the 5th state).

I completely agree that the exclude clause is much cleaner syntactically
and the specification compiler should handle them (requirement), but
I don't think they are a consideration in terms of the "compiled" spec
that must be evaluated in the kernel as the process is being run.

*Getting Pragmatic
*
I have been assuming a model something like the following:

 -  There is a *presentation mask* format (the mask source) that is
     platform independent and probably human readable.

 -  There is a *compiled mask* which is designed to optimize *mask
     evaluation*, i.e., the chroot like semantics.

 -  The mask evaluation is done by the *mask interpreter* which is
    in the kernel (reiser4 area until we take over the world ;-) ).

 -  That the format produced by tracing can be converted to a
    presentation mask for user editing.

Proposed definition:

    An extension to the presentation mask language is *syntactic sugar*
    Iff it does not require increasing the complexity of the mask 
interpreter.


--------------030109060106050904040804
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
<blockquote type="cite" cite="mid41243FA3.1010609@namesys.com">George
Beshers wrote:
  <br>
  <br>
  <blockquote type="cite"><br>
Ah... my language design background gets us into communication trouble
:-)
    <br>
    <br>
Suppose for a moment that exclude actually added functionality (as for
example
    <br>
regular expressions over file names will) what terminology would you
use?
    <br>
You see, to me the exclude is, at some level, little more than
syntactic sugar
    <br>
for the specification tools because the expressive power is equivalent
in theory
    <br>
even if using exclusion is much more convenient in practice.
    <br>
  </blockquote>
  <br>
Do you consider the various turing complete languages to have
significant semantic differences?
  <br>
</blockquote>
Yes, but I understand your point.<br>
<br>
The distinction I am drawing is that something is syntactic sugar if
there is an<br>
algorithm to translate some syntactic construct into a subset of a
language<br>
with more primitive attributes, e.g., 'elseif' is syntactic sugar.<br>
<br>
Assume the alphabet is lower case letters for simplicity.<br>
<blockquote>exclude "bar"<br>
</blockquote>
becomes<br>
<blockquote>include ".|..|[ac-z][b-z][a-qs-z]|...+"<br>
</blockquote>
A moments thought and you will see that both can be implemented with<br>
5 state finite state autometa (adding a failure/success state as the
5th state<br>
with entire alphabet transitioning to the 5th state).<br>
<br>
I completely agree that the exclude clause is much cleaner syntactically<br>
and the specification compiler should handle them (requirement), but<br>
I don't think they are a consideration in terms of the "compiled" spec<br>
that must be evaluated in the kernel as the process is being run.<br>
<br>
<b>Getting Pragmatic<br>
</b><br>
I have been assuming a model something like the following:<br>
<br>
&nbsp;-&nbsp; There is a <b>presentation mask</b> format (the mask source) that
is<br>
&nbsp;&nbsp;&nbsp;&nbsp; platform independent and probably human readable.<br>
<br>
&nbsp;-&nbsp; There is a <b>compiled mask</b> which is designed to optimize <b>mask<br>
&nbsp;&nbsp;&nbsp;&nbsp; evaluation</b>, i.e., the chroot like semantics.<br>
<br>
&nbsp;-&nbsp; The mask evaluation is done by the <b>mask interpreter</b> which is<br>
&nbsp;&nbsp;&nbsp; in the kernel (reiser4 area until we take over the world <span
 class="moz-smiley-s3"><span> ;-) </span></span>).<br>
<br>
&nbsp;-&nbsp; That the format produced by tracing can be converted to a<br>
&nbsp;&nbsp;&nbsp; presentation mask for user editing.<br>
<br>
Proposed definition:<br>
<br>
&nbsp;&nbsp;&nbsp; An extension to the presentation mask language is <b>syntactic
sugar</b><br>
&nbsp;&nbsp;&nbsp; Iff it does not require increasing the complexity of the mask
interpreter.<br>
<br>
</body>
</html>

--------------030109060106050904040804--

