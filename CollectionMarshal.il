
.class public abstract sealed auto ansi beforefieldinit
    System.Runtime.InteropServices.CollectionMarshal
{

    .method public hidebysig static valuetype [System.Memory]System.Span`1<!!0/*T*/>
        AsSpan<T>(
          class [mscorlib]System.Collections.Generic.List`1<!!0/*T*/> list
        ) cil managed
        {
        .maxstack 3
        .locals init (
            [0] valuetype [System.Memory]System.Span`1<!!0/*T*/> V_0
        )

            // [19 16 - 19 80]
            IL_0000: ldarg.0      // list
            IL_0001: brfalse.s    IL_0016
            IL_0003: ldarg.0      // list
            IL_0004: ldfld        !0/*T*/[] class [mscorlib]System.Collections.Generic.List`1<!!0/*T*/>::_items
            IL_0009: ldc.i4.0
            IL_000a: ldarg.0      // list
            IL_000b: ldfld        int32 class [mscorlib]System.Collections.Generic.List`1<!!0/*T*/>::_size
            IL_0010: newobj       instance void valuetype [System.Memory]System.Span`1<!!0/*T*/>::.ctor(!0/*T*/[], int32, int32)
            IL_0015: ret
            IL_0016: ldloca.s     V_0
            IL_0018: initobj      valuetype [System.Memory]System.Span`1<!!0/*T*/>
            IL_001e: ldloc.0      // V_0
            IL_001f: ret

    }
}
