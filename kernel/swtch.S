.globl swtch
swtch:
    # 保存当前上下文到 old
    # old 中的旧数据是无效的，会被直接覆盖，其只是一个存储位置
    sd x1, 0(x10)
    sd x2, 8(x10)
    sd x8, 16(x10)
    sd x9, 24(x10)
    sd x18, 32(x10)
    sd x19, 40(x10)
    sd x20, 48(x10)
    sd x21, 56(x10)
    sd x22, 64(x10)
    sd x23, 72(x10)
    sd x24, 80(x10)
    sd x25, 88(x10)
    sd x26, 96(x10)
    sd x27, 104(x10)

    # 从 new 恢复上下文
    # new 的数据是有效的，它将会在接下来被加载到寄存器中
    ld x1, 0(x11)
    ld x2, 8(x11)
    ld x8, 16(x11)
    ld x9, 24(x11)
    ld x18, 32(x11)
    ld x19, 40(x11)
    ld x20, 48(x11)
    ld x21, 56(x11)
    ld x22, 64(x11)
    ld x23, 72(x11)
    ld x24, 80(x11)
    ld x25, 88(x11)
    ld x26, 96(x11)
    ld x27, 104(x11)
    
    ret
