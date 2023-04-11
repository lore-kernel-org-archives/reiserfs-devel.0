From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v10 4/4] evm: Support multiple LSMs providing an xattr
Date: Tue, 11 Apr 2023 03:22:52 -0400
Message-ID: <1496aa1d378c3d7dc1b112b0d81fa7459aaee143.camel@linux.ibm.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
         <20230331123221.3273328-5-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bpf-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=jx6ec3n4+Q018kA05bpZ4S4XVg3SaIZoPHl0RO8efsY=;
 b=sy3/HVgtWc3RKyyBGjbNS48nYmcwrL4porSdU93DJ01UJpiC9K+chQhNejUA8+3QE2Nv
 WDfF+KxwVg6ES6YRDtaoUd5PddrB4hdFxPPtg5pZFtGi/7P4uiJNmvDtnBDxfJwEPFS3
 6KCgvOZ3aT4QNKHpyym1cjN7HWOY45FAVq836Z9tWpT2JLCyoF2aDUCa45VeQWhKrNmc
 AIlnU9Nm9sg22iDtzVbjikIkIVbyO0MerDJZFQV2ngU8CvGSXJyEmR/sRpX0asc8B9iu
 to31TYtVWujOGyZ/M6OQu2s22dMqXbxV39lRGfhRcrZWBg3DluJ0zVeOnOyoiwfpd3NW dA== 
In-Reply-To: <20230331123221.3273328-5-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-03-31 at 14:32 +0200, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Currently, evm_inode_init_security() processes a single LSM xattr from the
> array passed by security_inode_init_security(), and calculates the HMAC on
> it and other inode metadata.
> 
> As the LSM infrastructure now can pass to EVM an array with multiple
> xattrs, scan them until the terminator (xattr name NULL), and calculate the
> HMAC on all of them.
> 
> Also, double check that the xattrs array terminator is the first non-filled
> slot (obtained with lsm_get_xattr_slot()). Consumers of the xattrs array,
> such as the initxattrs() callbacks, rely on the terminator.
> 
> Finally, change the name of the lsm_xattr parameter of evm_init_hmac() to
> xattrs, to reflect the new type of information passed.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

