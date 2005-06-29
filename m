From: Chet Hosey <chosey@nauticom.net>
Subject: Re: dmapi support for reiser4
Date: Wed, 29 Jun 2005 18:41:46 -0400
Message-ID: <42C323AA.1070802@nauticom.net>
References: <20050628093408.GA23882@lisa.goe.net> <1119958258.3495.52.camel@tribesman.namesys.com> <20050629115713.GC3610@lisa.goe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050629115713.GC3610@lisa.goe.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjoern JACKE <bjoern@j3e.de>
Cc: reiserfs-list@namesys.com

Bjoern JACKE wrote:

> Hi,
> On 2005-06-29 at 20:15 +0400 Vladimir Saveliev sent off:
>
>> I would guess that it is rather operating system feature than a
>> filesystem one. Can you please point some source of information about
>> DMAPI?
>
>
> the main part is to be done by the filesystem, the OS cannot do
> everything by itself, there a plenty of things which just the
> filesystem can do by itself. Here are some links:
>
> http://www.opengroup.org/onlinepubs/9657099/
> http://www.computer.org/conferences/mss95/lawthers/lawthers.htm
> http://www.csu.edu.au/special/auugwww96/proceedings/alex/alex.html
>
> You can also take a look at the XFS and JFS source code parts of dmapi
> to get
> an impression of what is to be done for it at fs layer.
>
> Bjoern

Is there a standard VFS interface that these filesystems present, or is
it done via filesystem-specific extensions? If the latter, perhaps you
should consider submitting a kernel patch that adds the required
interface to the VFS layer, and note in your submission that XFS and JFS
aren't compliant.

How is DMAPI different from FAM with an extra API function for creating
explicit holes?

You said that "reiser4 will not be a real competitor without this". A
competitor in what market? Can you name an application that depends on
DMAPI and is so important that without that particular application
Reiser4 is not appropriate for storing files?

I note that the second link you provided is ten years old, nearly to the
day. The third is nine years old.I'm not suggesting that you're
overstating the importance of DMAPI, but why do you think that something
so important might have been overlooked for so long? Novell just
switched to Reiserfs as their default SUSE filesystem. If Reiserfs isn't
a "real competitor" without DMAPI, why would they do something so unwise?

Just curious, as I'd not heard of DMAPI prior to your post, but you
claim it's quite important.

-- chet

