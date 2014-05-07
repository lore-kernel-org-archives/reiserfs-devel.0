From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 11/29] reiserfs: cleanup, make hash detection saner
Date: Wed, 07 May 2014 08:16:02 -0400
Message-ID: <536A2402.50401@suse.com>
References: <20140423140033.704113918@suse.com> <20140423151140.523418072@suse.com> <20140506212739.GC1220@quack.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140506212739.GC1220@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Dave Jones <davej@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 5/6/14, 5:27 PM, Jan Kara wrote:
> On Wed 23-04-14 10:00:44, Jeff Mahoney wrote:
>> The hash detection code uses long ugly macros multiple times to
>> get the same value. This patch cleans it up to be easier to
>> read.
>> 
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com> --- 
>> fs/reiserfs/super.c |  108
>> ++++++++++++++++++++++++---------------------------- 1 file
>> changed, 50 insertions(+), 58 deletions(-)
>> 
>> --- a/fs/reiserfs/super.c +++ b/fs/reiserfs/super.c @@ -1668,71
>> +1668,63 @@ static __u32 find_hash_out(struct super_
> ...
>> + +	if (deh_hashval == yurahash) +		hash = YURA_HASH; +	else if
>> (deh_hashval == teahash) +		hash = TEA_HASH; +	else if
>> (deh_hashval == r5hash) +		hash = R5_HASH; +	else { +
>> reiserfs_warning(s, "reiserfs-2506", +				 "Unrecognised hash
>> function"); +		hash = UNSET_HASH; +		goto out; +	} +	return
>> hash;
> But you don't call pathrelse(&path) for some cases it seems while 
> previously it has been called always. Or am I missing something?


No, it needs to be called. That return should be dropped and we'll
fall through correctly.

Thanks,

- -Jeff

> 
> Honza
>> 
>> +out: pathrelse(&path); return hash; }
>> 
>> 


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTaiQBAAoJEB57S2MheeWyQJUP/ROFtjGsRU8s2VxiYok9Zjrt
sLDh8sLwOEosri/nDrC82hlbIuFmqLYsKlBfnhp1uNlBpQo6o86gjioTcCYiq+m/
+IPqjO3KQmlBrvUM9SbX16fcPtoKHpeW0s8og5xcXf9o17N6JnGS441C/3jfXdJW
EyF3T/W5TPJzAo0X+hnC8I1V6qF9U0MA6cSXo0Jzfsr190OQ7UQBs1jfmyglZ8oV
xYOEgtPCf00NX2XWcpiiEqLTt+KKfeGhtTjQpCU4rcb4SayczxlsY6u+2jbpzZol
hA1iHKXQ37Bacxy2ySiwHfvwWu30KEf7G+CrVXv0bs6v0kBix+2vvhr3X4Po/hYv
rY7DtIwvHEwkXw3qHUj2O4IO+eovDAgdRpEQKjF92S7YxcVEiKed1DcCs0OFV63x
CX5JZdegzXAO9K0Lq5vYSyhhNBiT6qRBK65morAayvJIG7AjcUsidrfyO+Cks66a
1iMeL3CAK4TV/HxW/R4i4CFEFKGEyMEaHGMgFPsFR7N/LPkrBZX5/ejuBfgrCqc5
xbkU+h8g4bvnftFIdj12HsmwfvPuEtfOY4lq9d41K1S/EUYjr1v2lbq6DjPr0APd
lgIcsgO6MQwkPLuzIR+8EHBwfkF6ypfWBAVqxAR8zJZ++ASy3EE019oZ4shLv6Ww
4RQWhDK0lvMisV5W+4vl
=L6OA
-----END PGP SIGNATURE-----
