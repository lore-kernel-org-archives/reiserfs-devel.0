From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Wed, 05 Jul 2006 15:12:35 -0400
Message-ID: <44AC0F23.5000308@suse.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com>  <44A55591.6060500@suse.com> <1152059846.30139.11.camel@ipso.snappymail.ca> <44AB25EE.8030702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44AB25EE.8030702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Mike Benoit wrote:
> 
>> Hi Jeff,
>>
>> I just tried the patch you suggested and it didn't make a difference.
>> The load still spikes as soon as the free space falls below ~10%.
>>
>>
> Jeff, please audit your code for what happens when all the bitmap blocks
> reach 90% full.  Could you discuss your design and code in that regard
> for our benefit?
> 
> Mike, thanks so much for going to this much effort.  It is rather likely
> this is a problem affecting many users.

Mike -

Can you post a copy of debugreiserfs -p <dev> |gzip -c > somefile.gz
somewhere? I can't reproduce that behavior locally and it would help
quite a bit if I had a test case where I could.

Thanks.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFErA8jLPWxlyuTD7IRAl03AJ4wPthmJ2/SSIJPux5waXGdaEoDeACfV2gK
g12ngw/mzsZUYC3Kj8uuIdE=
=1qtg
-----END PGP SIGNATURE-----
