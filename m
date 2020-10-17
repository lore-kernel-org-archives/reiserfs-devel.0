From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
Date: Sat, 17 Oct 2020 17:53:05 +0200
Message-ID: <fe9dafa8-0fef-7046-fea7-f2344adc2ee1@gmail.com>
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
 <20201004095922.GC1104@bug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=amQ8vE2LZX99CSwDilFQzQGa2tS1RKAkSyt0DblJjS0=;
        b=nFh7YdVPyOxKq3XLhVvFb1RnshslJoRjTDc88GUgak545GOgEoF0VcY/BDU8i3nJWw
         djnT2wjUheeZ1dJgrX2eNGrVuYtpJmKJ0zx4aZVnCCAwKkZhCjyhi+Jw57u+NmLOFFiz
         v/v+dztf5LAakbuBn7Pt+gkhgDxiTDW5GcFKNqOVmG/8IwDaUi19g59yzEmNm4PrP6NH
         AVHg0RjdGPuPyda5pDEAYX+948wj0Vs1dbHGQDS7d/wLsAmd5kB2z+bVjTg9MijhdcZl
         rT5c9p5uaxHiwgsRIhqjKUbPpnMfFxFT0h58MHxx7merc2esz2JeZ7n++P0Ws5dDtab2
         D0qQ==
In-Reply-To: <20201004095922.GC1104@bug>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@ucw.cz>, Metztli Information Technology <jose.r.r@metztli.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org


On 10/04/2020 11:59 AM, Pavel Machek wrote:
> Hi!
> 
>>> In particular, using this functionality, user is able to push out
>>> "hot" files on any high-performance device (e.g. proxy device) and pin
>>> them there.
> 
> What permissions are normally required for file migration?

Hi Pavel,
I guess, admin ones.
With such operation it is possible to organize an attack on a
collectively shared volume by clogging some its brick. So that other
users, who rely on regular distribution (provided by per-volume
distribution table) will get "no space left on device", while other
bricks contain a lot of free space..

> 
>>> COMMENT. After ioctl successful completion the file is not necessarily
>>> written to the target device! To make sure of it, call fsync(2) after
>>> successful ioctl completion, or open the file with O_SYNC flag before
>>> migration.
> 
> Ok.
> 
>>> COMMENT. File migration is a volume operation (like adding, removing a device to/from
>>> a logical volumes), and all volume operations are serialized. So, any attempt to
>>> migrate a file, while performing other operation on that volume will fail. If some
>>> file migration procedure fails (with EBUSY, or other errors), or was interrupted by
>>> user, then it should be repeated in the current mount session. File migration
>>> procedures interrupted by system crash, hared reset, etc) should be repeated in the
>>> next mount sessions.
> 
> Dunno. Returning -EBUSY is kind of "interesting" there. I'd expect kernel to queue
> the callers, because userland can't really do that easily.
> 

You are right. The current solution is temporary. Actually, we don't
need to lock the whole volume in order to migrate a file (anyway, the
file migration procedure takes an exclusive access to the file).

User-defined migration of individual files should be serialized with
brick removal. So it will be even per-brick lock rather than per-volume
lock.. I think, that it should be a rw-semaphore. Brick removal
procedure will take a write lock (with possible waiting) and
user-defined migration will try to take a read lock. If busy, then
return error (brick is under removal == doesn't exist for user).

Thanks,
Edward.
