From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
Date: Sat, 13 Mar 2021 12:37:44 +0100
Message-ID: <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8rI7FDuJts1MIljIxgtcS1T4PDaXvLXXm5I/06Ee08I=;
        b=QB8u/jRYufCfiSK/yTnajBdqntl0sr/kORCpcniXvhbK8NwoP60ZFsc1PVu2m41Y0d
         yuHYRrCQfvZy+E8qhI8ZflEVd6XoWEjAxWrS9sCFcE9GW+Acs9gTSGn7pIIulS0YwVbL
         YNlKomRBoKUd1inGBCSaGpq1c0HQKei0Zdnu/uzpraOEb50zejdZ8Z8ftP8x3rpFoTM/
         7HNeace/99C+RAqVkoQPIS6ubvDmTOnOFWor4JuA0YvXO6RmmzUhjrRVmKtwnx4cua6m
         PIsyEe/5xwS0BpmyRj2/gsvIOEt75qdj7knXa4lApXeh1h7G57kv64SMgHTaIKUTicwC
         SIOg==
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


It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
binary uuid can't contain '\0' symbols, which apparently is wrong.
Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
not set and prints "none" ;)

I'll try to prepare a fixup a bit later.
Special thanks for the nice testing script!

Edward.


> Thanks,
> Mike
> 
> [1] Sporadic failure of test case
> My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
>      https://gitlab.gnome.org/GNOME/gparted/-/issues/145
> 
