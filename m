From: Clifford Beshers <clifford.beshers@lindows.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Fri, 14 May 2004 12:41:15 -0700
Message-ID: <40A520DB.4080200@lindows.com>
References: <20040329185901.62166.qmail@web25008.mail.ukl.yahoo.com> <406885F1.9040409@mrs.umn.edu> <40A587FF.30103@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;boundary="------------080006040909050903050104"
Return-path: <reiserfs-list-return-18704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A587FF.30103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--------------080006040909050903050104
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hans Reiser wrote:

> Grant Miner wrote:
>
>> Someone mentioned earlier, and I like just the at sign: @ Think of it 
>> short for "attributes".
>>
>> file/@/uid
>>
>> The nice thing about @ is it shows up early lexicographically, it's 
>> short and unlikely to be used.  This name is important to pick well 
>> because it will likely set a long precedent.
>>
> It would be a problem for utilities like scp....
>
Hans, are you sure?  I tried some examples and had no troubles.  From my 
history:

      588  cd ~/tmp
      589  mkdir -p foo/@
      590  touch foo/@/uid
      591  scp -rp foo/@/uid stan:/tmp
      592  ssh stan 'mkdir -p /tmp/foo/@ ; touch /tmp/foo/@/uid'
      593  scp -rp stan:/tmp/foo/@ .

I'm not sure if @ is a good choice or not, but I don't think it would 
actually cause trouble syntactically, because everything expecting 
hostnames looks for a colon.

--

This message contains information which may be confidential and privileged. Unless you are the 
addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
the message or any information contained in the message. If you have received the message in error, 
please advise the sender and delete the message.  Thank you.

--------------080006040909050903050104
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Hans Reiser wrote:<br>
<blockquote type="cite" cite="mid40A587FF.30103@namesys.com">Grant
Miner wrote:
  <br>
  <br>
  <blockquote type="cite">Someone mentioned earlier, and I like just
the at sign: @ Think of it short for "attributes".
    <br>
    <br>
file/@/uid
    <br>
    <br>
The nice thing about @ is it shows up early lexicographically, it's
short and unlikely to be used.&nbsp; This name is important to pick well
because it will likely set a long precedent.
    <br>
    <br>
  </blockquote>
It would be a problem for utilities like scp....
  <br>
  <br>
</blockquote>
Hans, are you sure?&nbsp; I tried some examples and had no troubles.&nbsp; From
my history:<br>
<br>
<blockquote>&nbsp; 588&nbsp; cd ~/tmp<br>
&nbsp; 589&nbsp; mkdir -p foo/@<br>
&nbsp; 590&nbsp; touch foo/@/uid<br>
&nbsp; 591&nbsp; scp -rp foo/@/uid stan:/tmp<br>
&nbsp; 592&nbsp; ssh stan 'mkdir -p /tmp/foo/@ ; touch /tmp/foo/@/uid'<br>
&nbsp; 593&nbsp; scp -rp stan:/tmp/foo/@ .<br>
</blockquote>
I'm not sure if @ is a good choice or not, but I don't think it would
actually cause trouble syntactically, because everything expecting
hostnames looks for a colon.<br>
<BR><PRE>
--

This message contains information which may be confidential and privileged. Unless you are the 
addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
the message or any information contained in the message. If you have received the message in error, 
please advise the sender and delete the message.  Thank you.
</pre><BR></body>
</html>

--------------080006040909050903050104--

