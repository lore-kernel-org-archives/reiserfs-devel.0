From: Bjoern JACKE <bjoern@j3e.de>
Subject: Re: dmapi support for reiser4
Date: Wed, 29 Jun 2005 18:32:13 +0200
Message-ID: <20050629163213.GA17006@lisa.goe.net>
References: <20050628093408.GA23882@lisa.goe.net> <1119958258.3495.52.camel@tribesman.namesys.com> <20050629115713.GC3610@lisa.goe.net> <1120061750.3725.91.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1120061750.3725.91.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,
On 2005-06-29 at 20:15 +0400 Vladimir Saveliev sent off:
>I would guess that it is rather operating system feature than a
>filesystem one. Can you please point some source of information about
>DMAPI?

the main part is to be done by the filesystem, the OS cannot do 
everything by itself, there a plenty of things which just the 
filesystem can do by itself. Here are some links:

http://www.opengroup.org/onlinepubs/9657099/
http://www.computer.org/conferences/mss95/lawthers/lawthers.htm
http://www.csu.edu.au/special/auugwww96/proceedings/alex/alex.html

You can also take a look at the XFS and JFS source code parts of dmapi to get
an impression of what is to be done for it at fs layer.

Bjoern
