From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Quota support for UID >65534
Date: Wed, 17 Jul 2002 14:52:02 +0200
Message-ID: <20020717145202.29e6e070.philippe.gramoulle@mmania.com>
References: <1026727900.18163.61.camel@max>
	<1026731371.21656.301.camel@tiny>
	<1026807249.1066.31.camel@max>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026807249.1066.31.camel@max>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 16 Jul 2002 10:14:08 +0200
Zeljko Brajdic <zorz@iskon.hr> wrote:


Following Honza recommandations , we simply stripped out the 
"if (id & ~0xFFFF)" line by hand and we now use quota ith 32bits UIDs without
any problem :o)

It's not a bug , more likely a test that's been there for long at the time
of 32bit UIDs were not ready , it think.

Thanks,

Philippe.

  |  We have found "error". :) In fs/dquot.c at line 2057 exists if
  |  statement:
  |  
  |          if (id & ~0xFFFF)
  |                  goto out;
  |  
  |  Is this feature or bug?! :) This have been found in vanilla kernel-2.4.18
  |  -- 
  |  v            ,   v  v
  |  Zeljko Brajdic - Zorz
  |  
  |  
