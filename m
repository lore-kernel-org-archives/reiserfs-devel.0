From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 17:42:12 -0400
Message-ID: <41267034.3070305@comcast.net>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com> <4123E3C9.90006@comcast.net> <4123F77C.6060703@namesys.com> <41240A04.7000502@comcast.net> <41243FA3.1010609@namesys.com> <4124A194.3030902@comcast.net> <4125A169.5080404@namesys.com> <4125F062.8090908@comcast.net> <41263F92.7010908@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010509090103010109090707"
Return-path: <reiserfs-list-return-20444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41263F92.7010908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

--------------010509090103010109090707
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Hans Reiser wrote:

> George Beshers wrote:
>
>>  -  There is a *compiled mask* which is designed to optimize *mask
>>
>>>      evaluation*, i.e., the chroot like semantics.
>>>
>>>  -  The mask evaluation is done by the *mask interpreter* which is
>>>     in the kernel (reiser4 area until we take over the world ;-) ).
>>>
>>>  -  That the format produced by tracing can be converted to a
>>>     presentation mask for user editing.
>>
>>
>>
>>
>> Just use the filesystem tree and create a few fall through and bounce 
>> off plugins.
>
>>
>>
>> For the proof of concept I agree.
>
>
> and for the non-proof of concept you would do what?
>
It depends on how useful people find the masks and what extensions 
people start
asking for.

I think mask composition (because of inheritance, group specific access 
rights,
whatever) is likely to be an emerging requirement.  Merging several masks
into a single mask would then be a form of optimization.

I also think that combining masks with other aspects of SELinux, as was 
suggested
in an earlier e-mail, is a potentially quite fruitful phase II scenario.

Another possibility is that simple paths will prove not to be 
sufficient, people
will want/need path patterns.  For example, each user is allowed their own
~user/bin and ~user/lib  and those programs can load .so's from trusted 
libraries
but not from ~user2/lib (for whatever reason).  The point is that in 
this case
is that a common substring is required.

So, for the time being, I will note that trees *are* a really good 
implementation
strategy for the masks that can be specified in my proof of concept proposal
and will wait for a compelling example to justify returning to full REs over
paths or promoting the utility of composition of masks.

Besides, I recently received saga advice about the dangers of "analysis 
paralysis"

    George, trust me, the project will be a LOT more fun if we implement
    the bare minimum
    and get it done early, and then after that spend the rest of the
    time doing what amuses us.

;-)

>>
>> Hans, while your points are valid, they are not compelling.  The 
>> transformations involved
>> have been well understood for 3-4 decades.
>> Ultimately, performance and scalability needs to drive these 
>> implementation/optimization
>> decisions and they can and should wait until we have something 
>> working and can take
>> measurements.
>>
>>> Proposed definition:
>>>
>>>>
>>>>     An extension to the presentation mask language is *syntactic 
>>>> sugar*
>>>>     Iff it does not require increasing the complexity of the mask 
>>>> interpreter.
>>>>
>>>
>>>
>>
>>
>>
>
>

--------------010509090103010109090707
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
<blockquote type="cite" cite="mid41263F92.7010908@namesys.com">George
Beshers wrote:
  <br>
  <br>
  <blockquote type="cite">&nbsp;-&nbsp; There is a *compiled mask* which is
designed to optimize *mask
    <br>
    <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp; evaluation*, i.e., the chroot like
semantics.
      <br>
      <br>
&nbsp;-&nbsp; The mask evaluation is done by the *mask interpreter* which is
      <br>
&nbsp;&nbsp;&nbsp; in the kernel (reiser4 area until we take over the world ;-) ).
      <br>
      <br>
&nbsp;-&nbsp; That the format produced by tracing can be converted to a
      <br>
&nbsp;&nbsp;&nbsp; presentation mask for user editing.
      <br>
    </blockquote>
    <br>
    <br>
    <br>
Just use the filesystem tree and create a few fall through and bounce
off plugins.
    <br>
  </blockquote>
  <blockquote type="cite"><br>
    <br>
For the proof of concept I agree.
    <br>
  </blockquote>
  <br>
and for the non-proof of concept you would do what?
  <br>
  <br>
</blockquote>
It depends on how useful people find the masks and what extensions
people start<br>
asking for.<br>
<br>
I think mask composition (because of inheritance, group specific access
rights,<br>
whatever) is likely to be an emerging requirement.&nbsp; Merging several
masks<br>
into a single mask would then be a form of optimization.<br>
<br>
I also think that combining masks with other aspects of SELinux, as was
suggested<br>
in an earlier e-mail, is a potentially quite fruitful phase II scenario.<br>
<br>
Another possibility is that simple paths will prove not to be
sufficient, people<br>
will want/need path patterns.&nbsp; For example, each user is allowed their
own<br>
~user/bin and ~user/lib&nbsp; and those programs can load .so's from trusted
libraries<br>
but not from ~user2/lib (for whatever reason).&nbsp; The point is that in
this case<br>
is that a common substring is required.<br>
<br>
So, for the time being, I will note that trees <b>are</b> a really
good implementation<br>
strategy for the masks that can be specified in my proof of concept
proposal<br>
and will wait for a compelling example to justify returning to full REs
over<br>
paths or promoting the utility of composition of masks.<br>
<br>
Besides, I recently received saga advice about the dangers of "analysis
paralysis"<br>
<blockquote>George, trust me, the project will be a LOT more fun if we
implement the bare minimum<br>
and get it done early, and then after that spend the rest of the time
doing what amuses us.
  <br>
</blockquote>
<span class="moz-smiley-s3"><span> ;-) </span></span><br>
<blockquote type="cite" cite="mid41263F92.7010908@namesys.com">
  <blockquote type="cite"><br>
Hans, while your points are valid, they are not compelling.&nbsp; The
transformations involved
    <br>
have been well understood for 3-4 decades.
    <br>
Ultimately, performance and scalability needs to drive these
implementation/optimization
    <br>
decisions and they can and should wait until we have something working
and can take
    <br>
measurements.
    <br>
    <br>
    <blockquote type="cite">Proposed definition:
      <br>
      <br>
      <blockquote type="cite"><br>
&nbsp;&nbsp;&nbsp; An extension to the presentation mask language is *syntactic sugar*
        <br>
&nbsp;&nbsp;&nbsp; Iff it does not require increasing the complexity of the mask
interpreter.
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <br>
    <br>
    <br>
  </blockquote>
  <br>
  <br>
</blockquote>
</body>
</html>

--------------010509090103010109090707--

