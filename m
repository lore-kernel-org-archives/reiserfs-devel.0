From: Marc Perkel <marc@perkel.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 05:26:55 -0700
Message-ID: <42FF388F.3010506@perkel.com>
References: <42FEC9F1.9040709@perkel.com> <20050814080812.GA22983@king.bitgnome.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090507030606060904060404"
Return-path: <reiserfs-list-return-25454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050814080812.GA22983@king.bitgnome.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser@namesys.com, reiserfs-list@namesys.com

--------------090507030606060904060404
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Mark Nipper wrote:

>On 13 Aug 2005, Marc Perkel wrote:
>  
>
>>So - how do you get Reiser 4 to work with ACLs? Can't find a mount 
>>option in any docs.
>>    
>>
>
>	They are not supported yet under Reiser4.  I'm sure this
>is keeping just a few people from early adoption at the moment.
>:)
>
>  
>
ACLs not supported? That's bizzare! That's insane!

I had been reading that the very reason you want to use Reiser 4 is 
because that's where the ACLs were going to be. It is after all built on 
a database and the Reiser4 page is full of talk about ACLs. It is 
claimed that Reiser4 is done and ready for the real world and no ACL 
support. Reiser 3 has ACL support. EXT3 has ACL support. Every other 
file system has ACL support.

How can there be a claim that Reiser4 is ready to be merged into the 
Kernel without ACL support? Here I am gearing up to switch over and now 
I can't. I just spent the last few week hassling Redhat to make Fedora 
more Reiser friendly. This is moe than just a little disapointing. It's 
just plain crazy.

So - what's the story with that? Why no ACLs in a system built on a 
dadtbase?

-- 
Marc Perkel - marc@perkel.com

Spam Filter: http://www.junkemailfilter.com
    My Blog: http://marc.perkel.com


--------------090507030606060904060404
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
Mark Nipper wrote:<br>
<blockquote cite="mid20050814080812.GA22983@king.bitgnome.net"
 type="cite">
  <pre wrap="">On 13 Aug 2005, Marc Perkel wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">So - how do you get Reiser 4 to work with ACLs? Can't find a mount 
option in any docs.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
	They are not supported yet under Reiser4.  I'm sure this
is keeping just a few people from early adoption at the moment.
:)

  </pre>
</blockquote>
ACLs not supported? That's bizzare! That's insane!<br>
<br>
I had been reading that the very reason you want to use Reiser 4 is
because that's where the ACLs were going to be. It is after all built
on a database and the Reiser4 page is full of talk about ACLs. It is
claimed that Reiser4 is done and ready for the real world and no ACL
support. Reiser 3 has ACL support. EXT3 has ACL support. Every other
file system has ACL support.<br>
<br>
How can there be a claim that Reiser4 is ready to be merged into the
Kernel without ACL support? Here I am gearing up to switch over and now
I can't. I just spent the last few week hassling Redhat to make Fedora
more Reiser friendly. This is moe than just a little disapointing. It's
just plain crazy.<br>
<br>
So - what's the story with that? Why no ACLs in a system built on a
dadtbase?<br>
<br>
<pre class="moz-signature" cols="80">-- 
Marc Perkel - <a class="moz-txt-link-abbreviated" href="mailto:marc@perkel.com">marc@perkel.com</a>

Spam Filter: <a class="moz-txt-link-freetext" href="http://www.junkemailfilter.com">http://www.junkemailfilter.com</a>
    My Blog: <a class="moz-txt-link-freetext" href="http://marc.perkel.com">http://marc.perkel.com</a>
</pre>
</body>
</html>

--------------090507030606060904060404--
