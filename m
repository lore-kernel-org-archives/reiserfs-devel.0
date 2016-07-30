From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Semantic (mountable) subvolumes in Reiser4
Date: Sat, 30 Jul 2016 11:20:10 +0200
Message-ID: <579C714A.7040304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-transfer-encoding;
        bh=F1IYHTRbK+0EUhcaXD2x1by+no9XDc1Fv7zH9zlezNk=;
        b=oikHniGmOkkhm5dLMOfeI92QAJpa0LKnbe47kMUXgBsJZIBex1zHQaj7JJq2vFjvtG
         Xz0BZFjormIeXtr+aITU8oiFXzAmg/ArmrHy/adb9A/XD6Vzih/yHfeEqfFhcVN0Un3z
         GpYFs/2KDBw57Kw3FTvEz+da0IwSWGk7hH9UajLqm75MZHUeIxQSA08BXq8mR1ZO9qZD
         KpbrsfZfnCxbk2Slcs/Hp47ZC5ldOv6rzTu2lDZap4hUHoCc7PBR5YI218J7mswj0GoE
         zpLTt2/bdWxkF6u1Hmjejkj3DDDkqOkQdwaCUO9VlexUb4zSOb72lZt82v7Fs5LRL4p8
         9kLw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Semantic (mountable) subvolume is simply a named subtree of the semanic 
tree.
Such subtree has unusual root, which is not refered by the parent directory.
That is, parent directory doesn't contain a record about that root. So 
normally,
you can not access this subtree. In order to access a semantic 
subvolume, you
first have to "mount" it. "Mounting" a semantic subvoume creates a 
reference to
its root (specifically, the mount point refers to that root), which makes it
accessible. In other bits semantic subvolumes look like usual subtrees 
of the
semantic tree, which are always "visible".

Semantic subvolumes is not something new, they are present in some other 
file
systems (though with different names) and have many applications in
virtualization (mostly due to their "isolation").

Semantic subvolumes can be easily implemented in Reiser4. if someone cares,
then I'll provide details.

Thanks,
Edward.
