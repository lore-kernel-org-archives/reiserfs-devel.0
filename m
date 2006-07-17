From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: vs-6030
Date: Mon, 17 Jul 2006 15:15:49 +0200
Message-ID: <20060717151549.ad23d5ab.reiser4@blinkenlights.ch>
References: <263a8b350503031343182f4e4a@mail.gmail.com>
	<1109923874.3504.577.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1109923874.3504.577.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Vladimir,

> Can you reproduce this easily?
> If no, please tell more about what did filesystem do when panic occured.

I've seen the same problem (vs-6030) today on one of our hosts:

It happened as soon as somebody tried to write data to
/home/$affected_user/ (..or a subdirectory)

 eg:
  dd if=/dev/urandom of=/home/$affected_user/Temp/test

always paniced the kernel (2.6.16.11) and reiserfsck didn't show any errors.


I created a metadump of the filesystem, would you like to have a look at it?

Regards,
 Adrian
