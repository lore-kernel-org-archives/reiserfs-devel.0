From: bugzilla-daemon@kernel.org
Subject: [Bug 216871] New: use after free when journal read failed
Date: Sat, 31 Dec 2022 12:13:46 +0000
Message-ID: <bug-216871-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672488826;
        bh=lpEmogGHuf5QhhLyGxuwMpgBpZ7bHSyo4ePOCoIhhYQ=;
        h=From:To:Subject:Date:From;
        b=fma5Qft9P9ITZw14CA9IJb1a9FPs8XH4c4+5JWxxfaKzJCZ/tEAKCMD6cJoT9GQbk
         wmgDyvsghgMOP1T39kpZ6jQa0RcuaJqk48aLNAsRT3nHJwyr1yS1abMrsuLf1VS68V
         kEN5BgMQh0UWDrnMmw1raCInmTGLy2bC2tN+0PRffxeN38OkCQqSiqsf5ZMRb8M8jJ
         t/83WzvcTCuIbaHc8anXPVunx0A6n4uO7cS2SDsA+45KuggfkZ8gSxlXl7GaJY1JAj
         6nwte9XA2TeXBIYAr+OLfVghSKpU4O9BR74gvDfqetVbah+QZGECeIQRVrqW/WBlqa
         6nYTOoFZxetlg==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216871

            Bug ID: 216871
           Summary: use after free when journal read failed
           Product: File System
           Version: 2.5
    Kernel Version: 6.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: 1527030098@qq.com
        Regression: No

When reading the journal header block failed, journal_read return 1. But the
caller journal_init ignores the value and doesn't handle this case. It will
cause a UAF bug at fs unmount.

https://elixir.bootlin.com/linux/v6.0.1/source/fs/reiserfs/journal.c#L2399

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
