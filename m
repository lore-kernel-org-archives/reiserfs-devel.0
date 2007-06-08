From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 07/39] reiserfs: introduce reiserfs_error()
Date: Fri, 08 Jun 2007 14:59:21 -0400
Message-ID: <4669A709.70707@suse.com>
References: <20070530220511.681688471@mail.jeffreymahoney.com> <20070530222058.368999370@mail.jeffreymahoney.com> <46688BE3.2000807@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46688BE3.2000807@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Jeff Mahoney wrote:
>>  Although reiserfs can currently handle severe errors such as journal failure,
>>  it cannot handle less severe errors like metadata i/o failure. The following
>>  patch adds a reiserfs_error() function akin to the one in ext3.
>>
>>  Subsequent patches will use this new error handler to handle errors more
>>  gracefully in general.
>>
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>
>> --
>>  fs/reiserfs/prints.c        |   33 +++++++++++++++++++++++++++++++++
>>  include/linux/reiserfs_fs.h |    3 +++
>>  2 files changed, 36 insertions(+)
>>
>> --- a/fs/reiserfs/prints.c	2007-05-30 15:43:37.000000000 -0400
>> +++ b/fs/reiserfs/prints.c	2007-05-30 17:55:06.000000000 -0400
>> @@ -373,6 +373,39 @@ void __reiserfs_panic(struct super_block
>>  		      id ? id : "", id ? " " : "", function, error_buf);
>>  }
>>  
>> +void reiserfs_handle_error(struct super_block *sb, int errno)
>> +{
>> +
>> +	if (sb->s_flags & MS_RDONLY)
>> +		return;
>> +
>> +	if (reiserfs_error_ro(sb)) {
>> +		reiserfs_info(sb, "Remounting filesystem read-only\n");
>> +		sb->s_flags |= MS_RDONLY;
>> +	} else {
>> +		reiserfs_journal_abort(sb, errno);
>> +	}
> 
> shouldn't reiserfs_journal_abort be called in either case?

Yeah, you're probably right. I mostly lifted the logic for this from
ext3, which is less fragile in that sense.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGaacJLPWxlyuTD7IRAvxeAJ9gj/bPaTeCI6TLo8lvT8fA8ziGnQCgori6
xmnW1N/FAUefyCVl42HEYIo=
=9vBW
-----END PGP SIGNATURE-----
