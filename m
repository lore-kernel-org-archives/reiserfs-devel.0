From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: rebuild-tree fails on large volume
Date: Mon, 08 Aug 2011 16:05:31 -0400
Message-ID: <4E40418B.2090103@suse.com>
References: <4E3A7945.9090404@i4yoo.de> <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org> <4E3CE7ED.2090909@suse.com> <4E3CF6C7.1090300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4E3CF6C7.1090300@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Christian Kujau <lists@nerdbynature.de>, Carsten Ralle <cr@i4yoo.de>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/06/2011 04:09 AM, Edward Shishkin wrote:
> On 08/06/2011 09:06 AM, Jeff Mahoney wrote:
>> On 08/06/2011 02:47 AM, Christian Kujau wrote:
>>> On Thu, 4 Aug 2011 at 12:49, Carsten Ralle wrote:
>>>> http://www.spinics.net/lists/reiserfs-devel/msg02679.html
>>>> 
>>>> I looked all over the place but couldn't find any infos about
>>>> the version to patch.
>>> 
>>> The patch applies cleanly to reiserfsprogs-3.6.21[0].
>>> 
>>> @Jeff: will the patch be applied to the next (?) reiserfsprogs
>>> release?
>>> 
>>> Thanks, Christian.
>>> 
>>> [0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/
>> 
>> I don't actually maintain reiserfsprogs unless the openSUSE version
>> has now become the official one. I've been meaning to get back to
>> you about this but it's been a rough week.
> 
> 
> What's up Jeff? You are writing btrfsck? :)

Hehe, nope. Not yet. I'm working on adding sane error handling to it.
BUG_ON doesn't work so well. :)

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk5AQYsACgkQLPWxlyuTD7KfTQCfSdQuSbdPDZI/RggOlOv6Igi2
vpUAn0UFBRsCebtxG+fO6vcKSeX+/nBb
=tSbk
-----END PGP SIGNATURE-----
