From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 14:48:56 +0400
Message-ID: <200609081448.56653.vs@namesys.com>
References: <200609081051.k88Ap9Yn031997@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609081051.k88Ap9Yn031997@smtp.hispeed.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: grossnik.mailinglists@hispeed.ch
Cc: reiserfs-list@namesys.com

Hello

On Friday 08 September 2006 14:51, grossnik.mailinglists@hispeed.ch wrote:
> Hi Vladimir
>
> >please run
> >for i in `cat /root/hda3.bad`; do debugreiserfs -1 $i /dev/hda3 >
> > /dev/null; done
>
> So many Thx for very fast response.
> Here's the output:
>
>
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602176 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602179 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602180 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602181 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602182 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602183 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602185 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602186 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602187 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602188 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602189 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602190 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602191 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602193 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602194 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602195 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602196 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602197 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602198 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602199 is used in ondisk bitmap
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
> 4602201 is used in ondisk bitmap
>

ok, all bad blocks are used. Lets try to find what they are used for:

get ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.19.3.tar.gz
and run its debugreiserfs:

cat /root/hda3.bad | debugreiserfs -x /dev/hda3
