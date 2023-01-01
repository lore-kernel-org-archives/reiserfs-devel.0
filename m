From: bugzilla-daemon@kernel.org
Subject: [Bug 216871] bug: use after free when journal read failed
Date: Sun, 01 Jan 2023 03:15:26 +0000
Message-ID: <bug-216871-695-43ZCneJAHz@https.bugzilla.kernel.org/>
References: <bug-216871-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672542926;
        bh=/HUlvnw6+1qrAmG337GtPrlFgjJtz+47jERx9tN97eo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ow9M/3S4ehIX//edEQ4SdL2ya2rELcrmDChyjY4ApcZTwUacVM05+vdhbxGBl8uFF
         u3K6u+hJYX5c56M7625QjTIOwRCRJxgClZbjOv7SIE7ZCgZamlzzu04gC4UTr9fZD8
         tNW/TVXwIsnMZ+OgZkRS1+XChT98H49JMlemjb+gA1EYvFzg+xwvutIE1lY2wvTSVM
         miBFfjZJQNRkWU21gp4WPvoO6A/Fpkx0FNr4awb+pue7wUMwOlKnj9HtJLNdFFM8i7
         HJjtnWsXmPCXp3LevxhyMkcDe32n1eiTcJb9Abbed55lmE4dUtvuGyys1qMA1FvBML
         EfOuP4oZuTAAA==
In-Reply-To: <bug-216871-695@https.bugzilla.kernel.org/>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216871

eriri (1527030098@qq.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|use after free when journal |bug: use after free when
                   |read failed                 |journal read failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
