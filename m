From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 207971] Wrong permissions with cp -a and reiserfs mounted with
 acl
Date: Fri, 08 Oct 2021 15:41:26 +0000
Message-ID: <bug-207971-695-sJHJUuieM5@https.bugzilla.kernel.org/>
References: <bug-207971-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633707687;
        bh=uyfImF8k27iVyXyiJjcEeVa6Op+B3tyE5j4ZLQdQLaw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WXCsUGp90hozhvAkHX5E6SXaX8NNn3OEDCMrG7UwrUTWmu9Uqy+N6KQMPYKBx5RiM
         r90P8lAackmo/BwvR8MiEWVkTCsT1hMw/XPJ6apt/7JG6kzv5mnVXwJF9hufFHb/Au
         Jq06wsnaDI5WwrDSBFdEbh88qz/6JTJ7YQKBc1E092PI6pn8jEbEhxoWmg79vA7fJt
         R6xfYUpEdgx8vWyl2EhuuL2OqOtXk5cpGL+gEGSn/MXWQds6K/eHwWR6xsTRbK99wL
         0+LauDpAli3P7pKEAkdLb1HeOAJiv3yJRs0SIBVTYARjxJQ3daldP+h7Z95CN5j1VY
         CxFLe9d3E2GtA==
In-Reply-To: <bug-207971-695@https.bugzilla.kernel.org/>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207971

--- Comment #1 from Marco (marco@nucleus.it) ---
I also tried with kernel:
5.14.10
5.15-rc4

but the problem persists.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
