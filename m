From: Marc Perkel <marc@perkel.com>
Subject: Re: WinFS beta out
Date: Wed, 31 Aug 2005 13:35:16 -0700
Message-ID: <43161484.7080501@perkel.com>
References: <e692861c0508292136543a02e1@mail.gmail.com> <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com> <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com> <43150100.40304@namesys.com> <4315D455.1050100@suse.com> <43160D8A.7010006@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010209050502070608090601"
Return-path: <reiserfs-list-return-25765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43160D8A.7010006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs List <reiserfs-list@namesys.com>

--------------010209050502070608090601
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Hans Reiser wrote:

>Jeff Mahoney wrote
>
>  
>
>>The current implementation is hardly what I had envisioned ACLs and
>>xattrs being on reiserfs -- but was the only solution we could find to
>>still allow the filesystem to be mounted on an earlier kernel.
>>
>>An ideal solution would have been to introduce reiserfs v3.7 with a new
>>magic, and add feature versioning to the superblock, similar to the way
>>ext[23] does it. I felt that would have been met with much, much more
>>resistance than the implementation I ultimately presented.
>>    
>>
>
>I understand that you meant well, and we just honestly disagree about
>when to code freeze a stable release and put all the new stuff in the
>next release.  I would never release code that dramatically reduces
>performance to the point of eliciting the remarks in this thread by the
>users, and that too is an honest disagreement.  I was offered money by
>more than one entity to do the design you did, and refused the money.
>
>All of what you wish you could have done differently is easily done in
>reiser4 because of plugins, and acls in reiser4 will happen when someone
>offers money (and they will, I am sure of it).
>
>  
>
I have to question the decision to freeze existing code when the new 
code isn't finished. For what it's worth I've switched to EXT3 because I 
want ACLs. I hope to come back to ReiserFS some day but right now it 
just doesn't have the features I need now. Abandoning Reiser 3 is going 
to end up losing you part of market share because EXT3 has made a lot of 
advances.

I'm still a fan and looking forward to Reiser 4. Just not sure what I 
can do to help. I'll offer you free spam filterinf Hans if that hels a 
little. I have the best spam filter on the planet.



--------------010209050502070608090601
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
<br>
<br>
Hans Reiser wrote:<br>
<blockquote cite="mid43160D8A.7010006@namesys.com" type="cite">
  <pre wrap="">Jeff Mahoney wrote

  </pre>
  <blockquote type="cite">
    <pre wrap="">The current implementation is hardly what I had envisioned ACLs and
xattrs being on reiserfs -- but was the only solution we could find to
still allow the filesystem to be mounted on an earlier kernel.

An ideal solution would have been to introduce reiserfs v3.7 with a new
magic, and add feature versioning to the superblock, similar to the way
ext[23] does it. I felt that would have been met with much, much more
resistance than the implementation I ultimately presented.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I understand that you meant well, and we just honestly disagree about
when to code freeze a stable release and put all the new stuff in the
next release.  I would never release code that dramatically reduces
performance to the point of eliciting the remarks in this thread by the
users, and that too is an honest disagreement.  I was offered money by
more than one entity to do the design you did, and refused the money.

All of what you wish you could have done differently is easily done in
reiser4 because of plugins, and acls in reiser4 will happen when someone
offers money (and they will, I am sure of it).

  </pre>
</blockquote>
I have to question the decision to freeze existing code when the new
code isn't finished. For what it's worth I've switched to EXT3 because
I want ACLs. I hope to come back to ReiserFS some day but right now it
just doesn't have the features I need now. Abandoning Reiser 3 is going
to end up losing you part of market share because EXT3 has made a lot
of advances. <br>
<br>
I'm still a fan and looking forward to Reiser 4. Just not sure what I
can do to help. I'll offer you free spam filterinf Hans if that hels a
little. I have the best spam filter on the planet.<br>
<br>
<br>
</body>
</html>

--------------010209050502070608090601--
