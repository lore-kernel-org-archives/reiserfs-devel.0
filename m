From: Mike Fleetwood <mike.fleetwood@googlemail.com>
Subject: Occasionally mkfs.reiser4 creates a file system without a UUID
Date: Fri, 12 Mar 2021 19:36:10 +0000
Message-ID: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=65E4h54/Ffn1yUoq5KkFEnpBoleESy6EUfah9Q4U0VM=;
        b=JET/fQborEmcSTb2XYu3hZrB5n9oH0HaTBSUirLai0IMxwVN6ufjXUlUCh33RFC9na
         NrlPHslGtnqI07ZA0zmw4LvSVTV+g8ZoqDu8w6kUbhgPi8c1Q10uwfUOTyWpLlxR4dkR
         HgCxYZXZtdeXgfYmUVyTThBlDIWNBWi7nbQ/RdFzg4hwRelz3FgYH5TQ1Lldzyogsxug
         FmCN2YygH/meOhLrBJjkgQLNYDrYNTF3rDttPbOfvW8ECn0ejQ1AcZ52a85y/ePIvqGQ
         D61qYiITkUIR3gr7Jo6Ae4pX3M+lVz50prAY6jqEYo7Q2SogSrqIirYTN7Ge43Ow+coY
         rW3A==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

Occasionally mkfs.reiser4 creates a file system without a UUID,
debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
GParted's file system interface CI tests [1] which exercises the resier4
commands.

In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
current code from GIT, the fault can easily be replicated like this:

truncate -s 256M test.img
i=1
while :
do
  mkfs.reiser4 --force --yes --label '' test.img
  line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
  echo "[$i] $line"
  ((i++))
  echo "$line" | grep -q '<none>' && break
done

Output fragment:
[1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
[2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
[3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
...
[35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
[36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
[37] uuid:        <none>

Performing the same test with resierfs and ext4 runs for many hours
doing 100,000s of iterations without issue.

Thanks,
Mike

[1] Sporadic failure of test case
My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
    https://gitlab.gnome.org/GNOME/gparted/-/issues/145
