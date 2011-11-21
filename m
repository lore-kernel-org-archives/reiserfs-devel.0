From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Plugin Option Settings
Date: Mon, 21 Nov 2011 21:56:36 +0100
Message-ID: <4ECABB04.3020902@gmail.com>
References: <CAMjNLwq-5SS=Z3EoGseGLHwBO+rcCV55zq1K5F6dXzfCUSv8JA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAMjNLwq-5SS=Z3EoGseGLHwBO+rcCV55zq1K5F6dXzfCUSv8JA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matias Seco <matias.jose.seco@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 11/21/2011 07:22 PM, Matias Seco wrote:
> I've wanted to ask an information about the plugin options:
> I've noted that default plugins setting listed over mkfs.reiser4 -p,
> dont include all different kinds of settable plugins types (id's: 0x1,
> 0x2, 0x6, 0x7, 0x8, 0x9, 0xa)
> For most of them it probably be because there is one option: but for
> 0x1 and 0x6,


This is because Reiser4 either doesn't possesses polymorphisms in some
interface INTRFC, or transitions in this interface are performed in an
intelligent fashion (automatically), so we need to introduce a special
"extension" (that is a new interface INTRFC_POLICY), and a set of new
plugins to enable such "intelligent transitions" by a simple assignment
"plugin = policy" in this extension;

Let's consider your examples.

0x6 - SD_EXT plugins.
There is no polymorphisms in this interface, i.e. there is no virtual
transitions between any pair of stat-data extensions, and respectively
no assignments in this interface are used.

0x1 - ITEM plugins.
Reiser4 possesses a partial polymorphism in this interface on the pair
extent40 <-> plain40. And we want to implement "intelligent
transitions" to store every small file in "tails" (fragments) and every
large one (>20K) as a set of unformatted blocks pointed to by extent
pointers. In order to specify this intelligent transitions we introduce
a new interface TAIL_POLICY (0x5) and 3 new plugins:

. extents (extents only);
. tails (tails only);
. smart ("intelligent transitions").

Now we can specify our intelligent transitions by an assignment
"plugin=smart" in the new interface.
Note, that assignments in the ITEM interface (plugin=extent40,
plugin=plain40) are not needed any more, as they correspond to
"plugin = extents" and plugin = tails" in our extension (TAIL_POLICY).
This is why you don't observe them in the list of "default plugins".

Thanks,
Edward.


  what are there behavior?
> 1 - we can avoid setting them ?
> 2 - there changes from time to time, depending on other settings ?
> 3 - there dfefault set is not listed?
>
> Greetings
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

