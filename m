From: Hans Reiser <reiser@namesys.com>
Subject: Re: r4.1 ?
Date: Wed, 26 Jan 2005 09:44:32 -0800
Message-ID: <41F7D700.9070801@namesys.com>
References: <27547285.20050125224458@wp.pl> <41F6DC39.6000705@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41F6DC39.6000705@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

David Masover wrote:

>
>
> Pysiak Satriani wrote:
> | Hi,
> |
> | I was wondering how close are we to reiser4.1 ?
> | Like in % of work done or some other measure.
> |
> | http://www.namesys.com mentions r4.1
> |
> | 'this and that' will be included in r4.1
>
> Which means it would either be included in some sort of experimental
> form of r4, or (more likely, I think) in a new branch.
>
> I haven't seen any work on any of the things delayed for 4.1, meaning
> either we are 0% done, or Hans has moved to a cathedral style of
> development.
>
> That, or I just haven't noticed such work.  I don't often read source 
> code.
>
It is an interesting question whether with a plugin architectural model 
we perhaps need a fundamentally different software release model, with 
the technical design now controlling what is the optimal release model.

There are three big things in progress right now that are alpha or worse 
quality.

Compression, Viewprinting (www.namesys.com/blackbox_security.html), and 
sys_reiser4()'s semantic enhancements.  Compression will hopefully be 
ready first.  Compression will have enough performance impact to justify 
calling it a 4.1 release and doing a press release, but you understand 
that in reality it is just a plugin.....
