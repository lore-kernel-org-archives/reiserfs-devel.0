From: Frank Carreiro <frank.carreiro@investools.com>
Subject: Re: Can't kill a process
Date: Tue, 06 Apr 2004 09:26:29 -0600
Message-ID: <4072CC25.8040107@investools.com>
References: <93c6993524.9352493c69@cyberschools.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080604030205070202080407"
Return-path: <reiserfs-list-return-17746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93c6993524.9352493c69@cyberschools.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------080604030205070202080407
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

The system originally was running ext3 until we flattened it and 
reinstalled RedHat with the reiser file system.  I have other systems 
not running reiser which perform just fine.  The problem seems to be 
pointed at the filesystem

I had presumed there was something I needed to tweak there.


Dave Poirier wrote:

>May I ask how is that related to ReiserFS?  Seems like a rather generic Linux problem to me, maybe you could try the Red Hat forums, mailing lists or IRC channels.
>
>Dave Poirier
>Webmestre DSFM / Technicien Informatique
>+1.204.997.6253
>
>----- Original Message -----
>From: Frank Carreiro <frank.carreiro@investools.com>
>Date: Tuesday, April 6, 2004 9:52 am
>Subject: Can't kill a process
>
>  
>
>>I have a rather intense process that has been running since last 
>>night.  
>>I wanted to kill it since it's eating up my cpu however kill and 
>>kill -9 
>>don't seem to be doing the trick.
>>
>>I'm running the reiser 3.6.25 file system on a RedHat Advanced 
>>Server 
>>(2.1) with 2.4.9-3.38smp kernel.
>>
>>It's simply counting the time away as it copies files to disk.  
>>I've 
>>reniced it to 15.  It's also on a raid 5 array and I've modified 
>>my 
>>min/max speed to 10/50.  Performance has improved however the 
>>process is 
>>still running. 
>>
>>Thoughts?
>>
>>thx
>>
>>
>>
>>
>>    
>>
>
>  
>

--------------080604030205070202080407
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
The system originally was running ext3 until we flattened it and
reinstalled RedHat with the reiser file system.&nbsp; I have other systems
not running reiser which perform just fine.&nbsp; The problem seems to be
pointed at the filesystem<br>
<br>
I had presumed there was something I needed to tweak there.<br>
<br>
<br>
Dave Poirier wrote:<br>
<blockquote type="cite" cite="mid93c6993524.9352493c69@cyberschools.ca">
  <pre wrap="">May I ask how is that related to ReiserFS?  Seems like a rather generic Linux problem to me, maybe you could try the Red Hat forums, mailing lists or IRC channels.

Dave Poirier
Webmestre DSFM / Technicien Informatique
+1.204.997.6253

----- Original Message -----
From: Frank Carreiro <a class="moz-txt-link-rfc2396E" href="mailto:frank.carreiro@investools.com">&lt;frank.carreiro@investools.com&gt;</a>
Date: Tuesday, April 6, 2004 9:52 am
Subject: Can't kill a process

  </pre>
  <blockquote type="cite">
    <pre wrap="">I have a rather intense process that has been running since last 
night.  
I wanted to kill it since it's eating up my cpu however kill and 
kill -9 
don't seem to be doing the trick.

I'm running the reiser 3.6.25 file system on a RedHat Advanced 
Server 
(2.1) with 2.4.9-3.38smp kernel.

It's simply counting the time away as it copies files to disk.  
I've 
reniced it to 15.  It's also on a raid 5 array and I've modified 
my 
min/max speed to 10/50.  Performance has improved however the 
process is 
still running. 

Thoughts?

thx




    </pre>
  </blockquote>
  <pre wrap=""><!---->
  </pre>
</blockquote>
</body>
</html>

--------------080604030205070202080407--

