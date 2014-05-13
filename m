From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Tue, 13 May 2014 10:15:29 -0400
Message-ID: <53722901.9070008@suse.com>
References: <20140423140033.704113918@suse.com> <20140513141333.GF22070@quack.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140513141333.GF22070@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Dave Jones <davej@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 5/13/14, 10:13 AM, Jan Kara wrote:
> On Wed 23-04-14 10:00:33, Jeff Mahoney wrote:
>> Hi all -
>> 
>> I've had this patchset kicking around for a while. After a 
>> conversation this past week about code that was horrible to read 
>> (using reiserfs's balance_leaf as the primary example) and
>> seeing that Dave Jones had scratched a bit of an itch, I decided
>> it was time to resync and push it out so I don't have to update
>> it forever.
>> 
>> BTW, as I'm basically the only person with substantial patches
>> against reiserfs, I'm 100% ok with disrupting context to this
>> extent. :)
>> 
>> This set consists of 29 patches in a few areas.
>> 
>> 1 - Convert the commit workqueue to a per-fs workqueue 2 - Clean
>> up ugly accessor macros to use more readable names 3 - Clean up
>> comments to use the normal kernel style 4 - Remove the unused
>> nblocks argument from journal_end 5 - Remove superblock argument
>> from journal_end (it's in the trans handle) 6 - Remove superblock
>> argument from journal_mark_dirty (see #5) 7 - Remove blocks
>> argument from journal_join (it's always 1) 8 - Remove leading
>> whitespace from labels 9 - Remove unnecessary parents 10 - Clean
>> up dirent creation 11 - Clean up hash detection 12-29 - Clean up
>> balance_leaf - This 2500-line function goes through 6 easily
>> distinguishable stages, each with several sub-parts. The patch
>> set splits up the stages and then reformats them to keep the
>> split as obvious as possible. The final result is a whole lot
>> easier to follow and easier on the eyes.
> OK, I have merged all the patches into my tree.
> 

Great, thanks!

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTcikBAAoJEB57S2MheeWy65oQAMJhBwLHNvuc11LEebg1049p
XX7o32ltQ22T7ER6YR4+IynNTe0XlJ8a/QtpuCiu3qWBdmHR47b+iVuN8Eu0Z3IY
qZMPx7jkJXVPAECF9/CWTh3YJ/HB9QkL1zp5BNfihQvXUmYs+wbHuQGHR0jh4vYH
Qj9kxoH76/eQMHnxIFSy1EEeGI3zjBscBM4qvjBZ3ahTiq0WV6xu6ru70Tue0fFv
ST2JjyGGAdJ/IpCUBnc10AzHqMNmEpRE7l5ama2mIV/cvNokvxTHwiycuYVz3p1m
wRE2IfSJ84Xue8mO57R3TXkgitz2WCIdah67x5oJtyHJUYq61MYcgnEr0SJSAJzr
KhO34qrJ2bQSVKnWwHrwnm+fbEBmcmkA25zNqaLNwJfS1y58M+GwxbYriarnZqgE
ndu1jB1m7o2vpDCxox+60MhAe5am4tfn95u8WvIuSLOyq3bo/WNZZpRlqL8xfm3+
5XOd+0jdQp3aIwofnt9QGOBZS5OFGnSR3yya1xuJ4KOv4bjbAKSLat4Tv62/VoFm
bYcEA7jV1TtzfgjvR2dA8M70fx1fKY0wntm7XupP5d4Y1BYIK4gbwrhTEc0Z2WNG
WSpnxRqOZTvV0E6sGNyYJYVWEkA2MplqeI3X7NeT8UN5/XmgaRsfB7OjJLk0gjN7
rWunXLnovNfP8AWkOS3I
=wYZx
-----END PGP SIGNATURE-----
