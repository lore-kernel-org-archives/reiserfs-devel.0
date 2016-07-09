From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 121761] New: A message during compile
Date: Sat, 09 Jul 2016 18:03:18 +0000
Message-ID: <bug-121761-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D121761

            Bug ID: 121761
           Summary: A message during compile
           Product: File System
           Version: 2.5
    Kernel Version: 4.7.0-rc6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: uvladimir@ukr.net
        Regression: No

CC [M]  fs/reiserfs/lbalance.o
  CC [M]  fs/reiserfs/ibalance.o
fs/reiserfs/ibalance.c: In function =E2=80=98balance_internal=E2=80=99:
fs/reiserfs/ibalance.c:1156:2: warning: =E2=80=98new_insert_key=E2=80=99=
 may be used
uninitialized in this function [-Wmaybe-uninitialized]
  memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=20
You are receiving this mail because:
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
