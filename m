From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: Cannot resubscribe to list - FIXED?
Date: Wed, 28 Jan 2004 16:53:35 -0500
Message-ID: <40182F5F.4010804@ysu.edu>
References: <3FFC1AE7.6050607@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FFC1AE7.6050607@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com, flx@msu.ru

It appears that our WebShield appliance was rejecting the
subscription confirmation address.  I was able to resubscribe using an 
off-campus account.

According to RFC 2821,

4.5.3.1 Size limits and minimums

    There are several objects that have required minimum/maximum sizes.
    Every implementation MUST be able to receive objects of at least
    these sizes.  Objects larger than these sizes SHOULD be avoided when
    possible.  However, some Internet mail constructs such as encoded
    X.400 addresses [16] will often require larger objects: clients MAY
    attempt to transmit these, but MUST be prepared for a server to
    reject them if they cannot be handled by it.  To the maximum extent
    possible, implementation techniques which impose no limits on the
    length of these objects should be used.

    local-part
       The maximum total length of a user name or other local-part is 64
       characters.

The confirmation address local part:
reiserfs-list-sc.1073481809.ojjifckemhliaooahdfi-jpdalbec=ysu.edu
12345678901234567890123456789012345678901234567890123456789012345
has 65 characters in my case.  By default, the WebShield appliance enforces the 
64-character limit from the RFC.  We tried increasing the limit, but the 
instructions we have are for an older version of the software and don't seem to 
work.  Can ezmlm be configured to limit the length of the addresses required to 
confirm a subscription to 64 characters?

Thanks,
John

John Dalbec wrote:

> Somehow I was unsubscribed from the ReiserFS mailing list on December 
> 7.  I have tried to resubscribe several times since then with no 
> success.  When I try to reply to the confirmation e-mail, I get a bounce 
> message like the one below.  I tried writing to reiserfs-list-owner but 
> got no response.  I tried writing to flx@msu.ru but got no response.  
> Can anyone help me get resubscribed?
> Thanks,
> John Dalbec
> 
> -------- Original Message --------
> Subject: Mail delivery failed: returning message to sender
> Date: Wed, 07 Jan 2004 09:37:26 -0500
> From: Mail Delivery System <Mailer-Daemon@ysu.edu>
> To: jpdalbec@ysu.edu
> 
> This message was created automatically by mail delivery software.
> 
> A message that you sent could not be delivered to one or more of its
> recipients. This is a permanent error. The following address(es) failed:
> 
>   
> reiserfs-list-sc.1073481809.ojjifckemhliaooahdfi-jpdalbec=ysu.edu@namesys.com 
> 
>     SMTP error from remote mailer after RCPT 
> TO:<reiserfs-list-sc.1073481809.ojjifckemhliaooahdfi-jpdalbec=ysu.edu@namesys.com>: 
> 
>     host thebsh.namesys.com [212.16.7.65]: 501 Syntax error - badly 
> formatted address
> 
> ------ This is a copy of the message, including all the headers. ------
> 
> Return-path: <jpdalbec@ysu.edu>
> Received: from dalbec.meshel.ysu.edu ([150.134.8.36] helo=ysu.edu)
>     by mail03.cc.ysu.edu with esmtp (Exim 4.24)
>     id 1AeEo7-0008Ck-3J
>     for 
> reiserfs-list-sc.1073481809.ojjifckemhliaooahdfi-jpdalbec=ysu.edu@namesys.com; 
> Wed, 07 Jan 2004 09:37:15 -0500
> Message-ID: <3FFC19BA.6090600@ysu.edu>
> Date: Wed, 07 Jan 2004 09:37:46 -0500
> From: John Dalbec <jpdalbec@ysu.edu>
> User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4) 
> Gecko/20030624 Netscape/7.1 (ax)
> X-Accept-Language: en-us, en
> MIME-Version: 1.0
> To:
>  reiserfs-list-sc.1073481809.ojjifckemhliaooahdfi-jpdalbec=ysu.edu@namesys.com 
> 
> Subject: (no subject)
> Content-Type: text/plain; charset=us-ascii; format=flowed
> Content-Transfer-Encoding: 7bit
> 
> 
> 
> 
> 
> 



