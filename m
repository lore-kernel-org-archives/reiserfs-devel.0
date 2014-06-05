From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Wed, 4 Jun 2014 20:21:38 -0700
Message-ID: <CAM12Q5TskXAshKURtLobNj=zB5Ri=nZt0b9pcAjvuaRtCZMdwQ@mail.gmail.com>
References: <20140423140033.704113918@suse.com>
	<c71b9e18a0a450c18283867ed8d2663e@mail.velocitynet.com.au>
	<538486D1.60900@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <538486D1.60900@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: doiggl@velocitynet.com.au, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

"I do not see a patch 03/29 in the list"

Was the above patch ever posted? I can not find it after applying
patches 01/29 and 02/29... against reiser4-for-3.14.1.patched kernel
3.14.5 source tree.


Best Professional Regards.

On Tue, May 27, 2014 at 5:36 AM, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 5/27/14, 5:23 AM, doiggl@velocitynet.com.au wrote:
>> On Wed, 23 Apr 2014 10:00:33 -0400, Jeff Mahoney <jeffm@suse.com>
>> wrote:
>>> Hi all -
>>>
>>> I've had this patchset kicking around for a while. After a
>>> conversation this past week about code that was horrible to read
>>>  (using reiserfs's balance_leaf as the primary example) and
>>> seeing that Dave Jones had scratched a bit of an itch, I decided
>>> it was time to resync and push it out so I don't have to update
>>> it forever.
>>>
>>> BTW, as I'm basically the only person with substantial patches
>>> against reiserfs, I'm 100% ok with disrupting context to this
>>> extent. :)
>>>
>>> This set consists of 29 patches in a few areas.
>>>
>>> 1 - Convert the commit workqueue to a per-fs workqueue 2 - Clean
>>> up ugly accessor macros to use more readable names 3 - Clean up
>>> comments to use the normal kernel style 4 - Remove the unused
>>> nblocks argument from journal_end 5 - Remove superblock argument
>>> from journal_end (it's in the trans
>> handle)
>>> 6 - Remove superblock argument from journal_mark_dirty (see #5)
>>> 7 - Remove blocks argument from journal_join (it's always 1) 8 -
>>> Remove leading whitespace from labels 9 - Remove unnecessary
>>> parents 10 - Clean up dirent creation 11 - Clean up hash
>>> detection 12-29 - Clean up balance_leaf - This 2500-line
>>> function goes through 6 easily distinguishable stages, each with
>>> several sub-parts.
>> The
>>> patch set splits up the stages and then reformats them to keep
>>> the split as obvious as possible. The final result is a whole
>>> lot easier to follow and easier on the eyes.
>>>
>>> -Jeff
>>>
>> Hello Jeff, I do not see a patch 03/29 in the list. Is this
>> correct ?
>
> The list seems to have filtered it. I've reposted it, cc'ing you.
>
> - -Jeff
>
>> --Glenn
>>
>> I see: [patch 01/29] reiserfs: use per-fs commit workqueues, Jeff
>> Mahoney [patch 02/29] reiserfs: cleanup, rename key and item
>> accessors to more friendly names, Jeff Mahoney [patch 04/29]
>> reiserfs: cleanup, remove nblocks argument from journal_end, Jeff
>> Mahoney [patch 05/29] reiserfs: cleanup, remove sb argument from
>> journal_end, Jeff Mahoney [patch 06/29] reiserfs: cleanup, remove
>> sb argument from journal_mark_dirty, Jeff Mahoney [patch 07/29]
>> reiserfs: cleanup, remove blocks arg from journal_join, Jeff
>> Mahoney [patch 08/29] reiserfs: cleanup, remove leading whitespace
>> from labels, Jeff Mahoney [patch 09/29] reiserfs: cleanup, remove
>> unnecessary parens, Jeff Mahoney [patch 10/29] reiserfs: cleanup,
>> remove unnecessary parens in dirent creation, Jeff Mahoney [patch
>> 11/29] reiserfs: cleanup, make hash detection saner, Jeff Mahoney
>> [patch 12/29] reiserfs: balance_leaf refactor, reformat
>> balance_leaf comments, Jeff Mahoney [patch 13/29] reiserfs:
>> balance_leaf refactor, move state variables into tree_balance,
>> Jeff Mahoney [patch 14/29] reiserfs: balance_leaf refactor, pull
>> out balance_leaf_insert_left, Jeff Mahoney [patch 15/29] reiserfs:
>> balance_leaf refactor, pull out balance_leaf_paste_left, Jeff
>> Mahoney [patch 16/29] reiserfs: balance_leaf refactor, pull out
>> balance_leaf_insert_right, Jeff Mahoney [patch 17/29] reiserfs:
>> balance_leaf refactor, pull out balance_leaf_paste_right, Jeff
>> Mahoney [patch 18/29] reiserfs: balance_leaf refactor, pull out
>> balance_leaf_new_nodes_insert, Jeff Mahoney [patch 19/29]
>> reiserfs: balance_leaf refactor, pull out
>> balance_leaf_new_nodes_paste, Jeff Mahoney [patch 20/29] reiserfs:
>> balance_leaf refactor pull out balance_leaf_finish_node_insert,
>> Jeff Mahoney [patch 21/29] reiserfs: balance_leaf refactor, pull
>> out balance_leaf_finish_node_paste, Jeff Mahoney [patch 22/29]
>> reiserfs: balance_leaf refactor, pull out balance_leaf{left,
>> right, new_nodes, finish_node}, Jeff Mahoney [patch 23/29]
>> reiserfs: balance_leaf refactor, format balance_leaf_insert_left,
>> Jeff Mahoney [patch 24/29] reiserfs: balance_leaf refactor, format
>>  balance_leaf_paste_left, Jeff Mahoney [patch 25/29] reiserfs:
>> balance_leaf refactor, format balance_leaf_insert_right, Jeff
>> Mahoney [patch 26/29] reiserfs: balance_leaf refactor, format
>> balance_leaf_paste_right, Jeff Mahoney [patch 27/29] reiserfs:
>> balance_leaf refactor, format balance_leaf_new_nodes_paste, Jeff
>> Mahoney [patch 28/29] reiserfs: balance_leaf refactor, format
>> balance_leaf_finish_node, Jeff Mahoney [patch 29/29] reiserfs:
>> balance_leaf refactor, split up balance_leaf_when_delete, Jeff
>> Mahoney
>>
>> #Reference: http://www.spinics.net/lists/reiserfs-devel/
>>
>
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
>
> iQIcBAEBAgAGBQJThIbRAAoJEB57S2MheeWyggUQAMb23ZQtmegX1CGO5USs/jL2
> ZEHQkwDBURnY3gMVLQwMTAb93pODFvBCMnI0qcLANCUEn0qzb32plN+psSjv1VFG
> +H6Yn/b/LSr8gqEm67DVfIZXn//seV5BIPwZvbescUzXtfdKY3TaOXytNXgk6weD
> w4qqwGMNGUShRTmWC/uxYk755JFYU9HG4xSRWNdDmT5kl+E5+5FGNLRCzcpkYO8M
> Sryi6/FP+jX3GfeQaXwySy/ALki7uQRbhUEHFhWIkNis5LI41QfE2zknNvoljGZd
> egoNlGdbqvbqisVQiNpqYIgerTKPFkngrg59HORZUyl9wv4YJriDYtNYZtcGfrSR
> Hc/lHES7ndF9VDF5iUeGc5AkHaT2NCBB8rkuzvpJdI9ZARBvSgoWjqemfn7QLbT9
> CYRcrVbJhYKYL24WXueOSasRRIVWNcrilpz5gTBQHWyZcpkb4nxL5ECuL1UIl9Wq
> 2fSQYs7ItQZYERCXP9GLbS2iGpCgflQeYJIxtx+lEIVKzFSmD9G9F9y7AW8QiL/u
> qgB+mkZMrKBm2uIq17zxhC/PzL6oHVWGLebATnPQ33OK0dk9aEKNliwiK/v05SIV
> zac31E/Er7X9huqhyVW9gyfCDIPUA/VcqTeTKL4tXJKbyooI8Yx3ePrZ3CXV+S7j
> LVEKJb6wfE/R6G8EoqTK
> =o6Qb
> -----END PGP SIGNATURE-----
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
