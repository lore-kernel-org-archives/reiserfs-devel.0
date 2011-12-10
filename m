From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Are there ways to enable Cleancache Support for ReiserFS 3.6?
Date: Fri, 09 Dec 2011 21:50:39 -0500
Message-ID: <4EE2C8FF.3030403@suse.com>
References: <4ECD78A7.3000103@t-online.de> <4EE2B296.9020004@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4EE2B296.9020004@t-online.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuels-adresse@t-online.de>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/09/2011 08:15 PM, Manuel Krause wrote:
> Not anyone anywhere being able to reply to this question?!

I'm afraid not. AFAIK the file system needs knowledge of cleancache in
order to use it. ReiserFS 3.6 has been in maintenance-only mode for
years now so nobody's written anything up to use it.

It may well be all you need to do include <linux/cleancache.h> in
fs/reiserfs/super.c and add a cleancache_init_fs(s) call to
reiserfs_fill_super().

That's about all the help I'm able to give, though.

- -Jeff

> On 2011-11-23 23:50, Manuel Krause wrote:
>> Hi,
>> 
>> there's Cleancache supported in kernel. And Frontswap would be
>> soon.
>> 
>> Is there a way to enable Cleancache for old ReiserFS 3.6 
>> filesystems?
>> 
>> Or a quick but clean hack?
>> 
>> Thanks for your reply,
>> 
- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJO4sj/AAoJEB57S2MheeWy1xEQAJBQmEe7EAMtCsMEdIV8ilDC
fy9uGnCCfuBhod5gjIAkO2eaMtYL6jTcY2mhD6jf9SMKh+aw6czm0jBfhPTh6eiJ
SPUC2PHNu9ztN2cweyodksUarzRqEA7Gt4DwXfY8PFcobwvc7TxA/54ZXcGW3uUi
0s8GK63hg3LCQFIfka1aI+zXI+mTZw7YJad9QHtzWPqNtNqVLY5eJqw8GElArdg0
aydzsmq/j+ptSyt5NGsm8qLRxN+OsjkeWJq9vUq7xAAyytGxh3k9X5H5U0tHYxAB
qqzN7PcN3jURt2Q7x1PAV7azRRDeKmlUNSJZ45bbiFQq7CZFIk7QHicq1z8Rr1Kx
w7rypqKlnpWg6Y5I69YVjTw+otafjHAt9jEdum6qIiez/+kmZzefLuQL/BUvWmdZ
MP8YzSJg/cjgI7AwG3phiTzIE+cqafvwJ6TCMM2rwLLCl7ZH5uscTZnbO49yMC1I
pdCHp/A3hKZFVvsZUxZedqx3l4cxP02y0k6f4WNnuzZ+WIhVlrnQwsFwgRVph2j7
W1LxyP2suyVjEYxuIBSRZjvtXprBCdQG3VSRnOlWEeDQ9xc7hTKDvqL5cwAOLzKk
t18hpGlVZQsnLoUhP+tBfxUYymo4xDD+rl54q7En7PZtrsS5NFYaw8lA51fFZv3V
zzFjkovLPeNg8pTxtAXZ
=g9sk
-----END PGP SIGNATURE-----
