From: "Daniel Horne" <daniel.horne@gmail.com>
Subject: Re: [Fwd: [Fwd: Re: Xattrs in reiser4 and Google Summer of Code]]
Date: Thu, 18 Dec 2008 09:53:30 +0000
Message-ID: <be789c640812180153t13f8e9bcn16565fdbc71c1729@mail.gmail.com>
References: <4943B62E.40706@gmail.com>
	 <be789c640812171351k7e2dee9cg50a3803caca231d8@mail.gmail.com>
	 <494988BB.4020908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=YWQP1vFzz3e4IxbHumilpIKQPZqwi6wZeR2onzySCdo=;
        b=LYI5e5pMEusW/HrffkE42zw9HH+rIyj8aWq4LlF0qgLMHYF9kfB2Or7x7XWFPOswZH
         8nnIQIHuNUgdTHdJ6vJvcLQB49GXEs7/yqOus44xHWwsYSTqGaIOwoj67nNz+8JRj1HK
         +RIePtFx1UQhRHtPI2dv4FvEEjq6Aqh3YwhVY=
In-Reply-To: <494988BB.4020908@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

2008/12/17 Edward Shishkin <edward.shishkin@gmail.com>


    Can you say more about this?
    Do you know an application that requires xattrs of length longer then
    4000 bytes?


User xattrs. What I'm thinking is that if you can set arbitrary
key:value pairs (which, of course, you can - through setfattr) the
"high bound"  number of xattrs per inode, and therefore total data
stored is pretty much unlimited.


    >
    > So, the temptation is to have something similar to the file plugin for
    > individual xattrs, with the xattr functions on a vfs file acting like
    > a directory of xattr-files. There'd be a large number of small objects
    > in the tree, of course, but that's a situation I understand R4 handles
    > well..
    >
    > So, what do you think?

    Let's forget about file-as-dir stuff. All what we need is a new file plugin
    with non-NULL methods, responsible for work with xattrs , and (maybe)
    a new stat-data plugin, which can handle stat-data items of arbitrary
    length.


Agreed.

--
DH
