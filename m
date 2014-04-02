From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix race in readdir
Date: Wed, 02 Apr 2014 14:34:34 -0400
Message-ID: <533C583A.7060402@suse.com>
References: <533C3382.3000808@suse.com> <20140402180955.GA13479@quack.suse.cz> <20140402182901.GA15907@quack.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140402182901.GA15907@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 4/2/14, 2:29 PM, Jan Kara wrote:
> On Wed 02-04-14 20:09:55, Jan Kara wrote:
>> On Wed 02-04-14 11:57:54, Jeff Mahoney wrote:
>>> jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)
>>>
>>> The -ENOENT is due to readdir calling dir_emit on the same entry twice.
>>>
>>> If the dir_emit callback sleeps and the tree is changed underneath us,
>>> we won't be able to trust deh_offset(deh) anymore. We need to save
>>> next_pos before we might sleep so we can find the next entry.
>>>
>>> This can also affect non-xattr users of readdir, though the race is tighter.
>>>
>>> Cc: <stable@vger.kernel.org> 
>>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>   The patch looks good to me so unless someone objects, I'll merge this
>> patch with Linus.
>   Umm, actually, what if dir_emit() returns error? Previously we tried
> again the same entry, now we continue with the next one. Is that intended?
> If yes, please comment on that in the changelog.

Sigh. Yes. You're right. I missed that part of the error handling.

- -Jeff


>>> ---
>>>  fs/reiserfs/dir.c |    9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> --- a/fs/reiserfs/dir.c
>>> +++ b/fs/reiserfs/dir.c
>>> @@ -179,6 +179,13 @@ int reiserfs_readdir_inode(struct inode
>>>  				memcpy(local_buf, d_name, d_reclen);
>>>  
>>>  				/*
>>> +				 * deh_offset(deh) will be invalid if dir_emit
>>> +				 * sleeps. We need to know the offset after
>>> +				 * this one to continue.
>>> +				 */
>>> +				next_pos = deh_offset(deh) + 1;
>>> +
>>> +				/*
>>>  				 * Since filldir might sleep, we can release
>>>  				 * the write lock here for other waiters
>>>  				 */
>>> @@ -196,8 +203,6 @@ int reiserfs_readdir_inode(struct inode
>>>  				if (local_buf != small_buf) {
>>>  					kfree(local_buf);
>>>  				}
>>> -				// next entry should be looked for with such offset
>>> -				next_pos = deh_offset(deh) + 1;
>>>  
>>>  				if (item_moved(&tmp_ih, &path_to_entry)) {
>>>  					set_cpu_key_k_offset(&pos_key,
>>>
>>> -- 
>>> Jeff Mahoney
>>> SUSE Labs
>> -- 
>> Jan Kara <jack@suse.cz>
>> SUSE Labs, CR


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJTPFg6AAoJEB57S2MheeWyNIoQAI9ZbPx1i2ycEfWV6qSzFH+/
L/4OZy4pVM8U4j0ljDlhvrRiKQ/r3843enKKSrpsJawIbWwXiOVY1Zvu3+FZ0T8Q
Bc+BL0gH43H4UTKh9EsAX0CfG9CGau7sFC1meOBPEs27OBMPn8Xgbg4zs4nwlaDz
TLo166LcdV55JYcndNzt/YIwOaRK6roTEJg2+5uX+hM0ZGDZan4+AMHyjdqV4VTk
JG8K/mthPF/tgZQMSHSIh3Xg9Gth3gPaPBsr0M2SdDxVQcao7BiCNgUvRMXyOQOl
2uVkzuX2fC5JYM569WyPYhNXNR/IQwgtJMRYkoVvtu/oMk5dhLQTeDLl+A4BrYFY
ucLG1VxY0gd215+vW/0hXjnBp5Gm9jtXeFiCWeFMBHWhvVpxHlcXfwEhEHLBPBJC
Dc48sJLqFWYtqM/WZ6eryUIdWgJsup/z8vEMCM18P+QUeG3DHANmACt93XptWw4b
8I6LyqisYOqKk1rZ0QDvdo4zq6ZHqQwbPEGmqOLnA2tbn+iYxGk5WGyWDh1I0SbW
RQowfNhvJKjj7qzb5C+GMfE04OtGw1Qa6JoR/x+KzAWafjRstSpMuupCoHg5sj1M
xEQka9U8vYZtnbxwzSl0yRTMLzZ3YmrLNjV0L9AmqKVm7H5BS6vscEDwQtV9fH1s
n4YTCcGORZSzvX7YNP8m
=xFMg
-----END PGP SIGNATURE-----
