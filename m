From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
Date: Fri, 12 Mar 2021 20:48:08 +0100
Message-ID: <ebb4b093-3141-c4ad-d99b-c310aa7dceb4@gmail.com>
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UjgTZDCt/nya/cQ7aylmMB5pjkTaS49pBVx4Qv2R+T0=;
        b=rv7xqh4zRjQkRKuugnuafJfExHkO9kLVNi3lAwq4DhrfCnr2++emdk2VHHRgHq82+L
         zUoPx3KrOW82nTe6i3y7gR3bT9RHtRRwV0cUPNEinT09GBc4dQZyH3RL4C5/NgwJ6Au5
         AFVcUXcFWv5pbOYcuSOFQdzldKjSKXk9KP+TwG9iKYYC/pCO+EB6mDQIrELfeUxXEURa
         eDRFwtYKQNHs9vhSTMLKlfJC0LL3D0QqYc23HRVtiYC7Kqaj1pszrTDSbvEY/t1L/xt3
         2c/IEno0C1jdlauxpaILbqwALAkagn0lhrsNujyBNSmbN+qrCECS/VUYIohru3iKgIzJ
         9FJw==
In-Reply-To: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fleetwood <mike.fleetwood@googlemail.com>, reiserfs-devel@vger.kernel.org

On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
> Hi,
> 
> Occasionally mkfs.reiser4 creates a file system without a UUID,
> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
> GParted's file system interface CI tests [1] which exercises the resier4
> commands.


Yeah, I know about this problem.
Unfortunately, haven't had a chance to find the root cause yet...
It shouldn't be a critical problem for 4.X.Y
For 5.X.Y - yes - it becomes sticky..

Thanks,
Edward.


> 
> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
> current code from GIT, the fault can easily be replicated like this:
> 
> truncate -s 256M test.img
> i=1
> while :
> do
>    mkfs.reiser4 --force --yes --label '' test.img
>    line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
>    echo "[$i] $line"
>    ((i++))
>    echo "$line" | grep -q '<none>' && break
> done
> 
> Output fragment:
> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
> ...
> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
> [37] uuid:        <none>
> 
> Performing the same test with resierfs and ext4 runs for many hours
> doing 100,000s of iterations without issue.
> 
> Thanks,
> Mike
> 
> [1] Sporadic failure of test case
> My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
>      https://gitlab.gnome.org/GNOME/gparted/-/issues/145
> 
