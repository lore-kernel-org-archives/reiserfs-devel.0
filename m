From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ACL support.
Date: Mon, 14 Apr 2014 00:22:59 +0200
Message-ID: <534B0E43.60406@gmail.com>
References: <5332645E.4070600@gmail.com>	<5332AD40.1020308@gmail.com> <CAJZSrNLHanHHgAV-E=1bpnbq4FvqYETQkOQhdsrEwLza+Yd90w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=3muFJ+AC4s84hOuFSKbUJxu3454brFeSfmBwQ23RJFY=;
        b=DWrC1nS+EG18XPZnXl6jSOJCjSP8VuuIS7aGV93TMzWEJi7I3gVI8QlANopOz0DKTF
         0Bftf6KgBT4WNETsXdg4cmnpZZh6BEMMR3vfm6p7myI8pr87qX2FuTtlOQb8/X75bQ3r
         jECbmFTvlugfCfnE/f1ekLFEYnp+HQ98p64YsXhbQ3NmCYEmYvliYdBT0Vagb++te3uV
         Mv0CJE5hKQYSA5Mr7xCcSAK/anHlBeA4Guz/+PDcj4KM1HaMmS6y/7GvjIa3Pib6WSpt
         sj40sKkqQSjyXSMDgOGVGG+gDMHjvFYNB3duYXLFMYDWY3L4Ihqfef9O5EXOOZNZTUWe
         suZA==
In-Reply-To: <CAJZSrNLHanHHgAV-E=1bpnbq4FvqYETQkOQhdsrEwLza+Yd90w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Horne <daniel.horne@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 04/08/2014 08:28 PM, Daniel Horne wrote:
> On 26 March 2014 10:34, Edward Shishkin <edward.shishkin@gmail.com
> <mailto:edward.shishkin@gmail.com>> wrote:
>
>     On 03/26/2014 06:23 AM, dE wrote:
>
>         Does reiser4 support ACL?
>
>
>     Nope for historical reasons.
>     I'll provide hints how to implement this, if someone wants..
>
>
> I occasionally have a look at making an XATTR implementation before
> getting sidetracked.
>
> There's a couple of points I'm not quite decided on:
>
> Whether to make a generic xattr stat_data plugin and use it to store all
> different types of attribute, or make different plugins for ACL, SElinux
> contexts, and user xattrs.
>
> You've previously stated that stat_data plugins are limited to 4k. This
> should be fine for selinux contexts and all but pathologically long
> access control lists, I'm not sure about the use of user xattrs. Would
> making separate stat_data plugins give separate 4k limits to each type
> of attribute, or is that all-inclusive?
>


Actually stat-data is an on-disk container of inode fields. That said, I 
would prefer to store xattrs in special items, which are different from 
stat-data (one such item per a pair (xattr_name, xattr_value)).


> There's also the matter of choosing an on-disk format. A simple list
> format, perhaps? Lookup would be O(n), but given the small amount of
> data we're expecting to store there, that may be OK.

I suggest that we use the following format for the xattr items.

The key of the item associated with the pair (xattr_name, xattr_value) 
is [base_key, offset], where base_key is calculated by build_xattr_key()
(not yet implemented). This function does mostly the same as 
build_sd_key(). The difference is that build_xattr_key() installs
a special reserved (and currently not used) minor locality 
KEY_ATTR_NAME_MINOR (see key.h for the definition).

64-bit key offset is composed of 32-bit major_offset and 32-bit minor 
offset. Major offset is a 32-hash of the xattr_name. Minor offset is the 
number of the collision in the chronology ordering.

Format of the item body is the following:
. size-of-xattr_name (16 bit)
. xattr_name;
. xattr_value

So getxattr(2) is resolved to the following actions:

. build base_key for the xattr_name;
. set major offset as hash(xattr_name);
. linear search for precise xattr_name among all items with the same 
[key_base, major_offset].
. return respective xattr_value (or NOT_FOUND).

setxattr(2) is resolved to the following actions:

. compose the item body in accordance with the format above;
. build base_key for xattr_name;
. set the major offset, i.e. hash(xattr_name);
. search for the xattr_name among all items with the same [base_key, 
major_offset];
. update the item body, or (depending on the flags) return EEXIST, if 
the item with xattr_name was found;
. set the respective minor_offset by the search results, if the item 
with xattr_name was not found;
. insert the new item with the [base_key, offset] to the current 
position in the tree.

For simplicity and performance reasons let's assume that xattr items are 
solid. That said, any xattr item contains exactly one unit. In 
particular, it means that sizeof(xattr_name + xattr_value) can not 
exceed 4096 - (sizeof(node_header) + sizeof(item_header)). Let's 
implement xattrs support with such restrictions for now. Also, don't 
update minor offsets of colliding items when removing xattr: I don't 
think that we'll exceed the limit for the number of collisions (2^32)
in the foreseeable future.

Makes sense?
Let me know if any problems..

Thanks,
Edward.
